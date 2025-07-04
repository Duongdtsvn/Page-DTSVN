/*
 * Copyright (C) 2007-2022 Crafter Software Corporation. All Rights Reserved.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as published by
 * the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package org.craftercms.sites.editorial

import org.opensearch.client.opensearch._types.SortOrder
import org.opensearch.client.opensearch._types.query_dsl.BoolQuery
import org.opensearch.client.opensearch._types.query_dsl.Query
import org.opensearch.client.opensearch._types.query_dsl.TextQueryType
import org.opensearch.client.opensearch._types.analysis.Analyzer
import org.opensearch.client.opensearch.core.SearchRequest
import org.opensearch.client.opensearch.core.search.Highlight
import org.apache.commons.lang3.StringUtils
import org.craftercms.engine.service.UrlTransformationService
import org.craftercms.search.opensearch.client.OpenSearchClientWrapper
import java.time.ZonedDateTime
import java.time.ZoneId
import java.time.format.DateTimeFormatter

class Searchnews {

  static final String ITEM_NEW_CONTENT_TYPE = "/page/item-new"
  static final String LIST_BLOG_PATH = "/site/website/list-blog"
  static final List<String> ITEM_NEW_SEARCH_FIELDS = [
    'title_vi_s^2.0',
    'content_vi_html^1.0',
    'title_en_s^1.5',
    'content_en_html^1.0'
  ]
  static final String[] HIGHLIGHT_FIELDS = ["title_vi_s", "content_vi_html", "title_en_s", "content_en_html"]
  static final int DEFAULT_START = 0
  static final int DEFAULT_ROWS = 50
  static final String MULTIPLE_VALUES_SEARCH_ANALYZER = Analyzer.Kind.Whitespace.jsonValue()

  OpenSearchClientWrapper searchClient
  UrlTransformationService urlTransformationService

  Searchnews(OpenSearchClientWrapper searchClient, UrlTransformationService urlTransformationService) {
    this.searchClient = searchClient
    this.urlTransformationService = urlTransformationService
  }

  def searchNews(userTerm, categories, start = DEFAULT_START, rows = DEFAULT_ROWS) {
    def query = new BoolQuery.Builder()

    // Filter by content-type
    query.filter(q -> q
      .match(m -> m
        .field("content-type")
        .query(v -> v
          .stringValue(ITEM_NEW_CONTENT_TYPE)
        )
      )
    )

    // Filter by path to only get items from /list-blog directory
    query.filter(q -> q
      .wildcard(w -> w
        .field("localId")
        .value("*" + LIST_BLOG_PATH + "*")
      )
    )

    if (categories) {
      // Filter by categories
      query.filter(getFieldQueryWithMultipleValues("categorys_o.item.key", categories))
    }

    if (userTerm) {
      // Check if the user is requesting an exact match with quotes
      def matcher = userTerm =~ /.*("([^"]+)").*/
      if (matcher.matches()) {
        // Using must excludes any doc that doesn't match with the input from the user
        query.must(q -> q
          .multiMatch(m -> m
            .query(matcher.group(2))
            .fields(ITEM_NEW_SEARCH_FIELDS)
            .fuzzyTranspositions(false)
            .autoGenerateSynonymsPhraseQuery(false)
          )
        )

        // Remove the exact match to continue processing the user input
        userTerm = StringUtils.remove(userTerm, matcher.group(1))
      } else {
        // Exclude docs that do not have any optional matches
        query.minimumShouldMatch("1")
      }

      if (userTerm) {
        // Using should makes it optional and each additional match will increase the score of the doc
        query
          // Search for phrase matches including a wildcard at the end and increase the score for this match
          .should(q -> q
            .multiMatch(m -> m
              .query(userTerm)
              .fields(ITEM_NEW_SEARCH_FIELDS)
              .type(TextQueryType.PhrasePrefix)
              .boost(1.5f)
            )
          )
          // Search for matches on individual terms
          .should(q -> q
            .multiMatch(m -> m
              .query(userTerm)
              .fields(ITEM_NEW_SEARCH_FIELDS)
            )
          )
      }
    }

    def highlighter = new Highlight.Builder();
    HIGHLIGHT_FIELDS.each{ field -> highlighter.fields(field, f -> f ) }

    SearchRequest request = SearchRequest.of(r -> r
      .query(query.build()._toQuery())
      .from(start)
      .size(rows)
      .highlight(highlighter.build())
      .sort(s -> s
        .field(f -> f
          .field("createdDate_dt")
          .order(SortOrder.Desc)
        )
      )
    )

    def result = searchClient.search(request, Map)

    if (result) {
      return processNewsSearchResults(result)
    } else {
      return []
    }
  }

  def getAllNews(start = DEFAULT_START, rows = DEFAULT_ROWS) {
    def query = new BoolQuery.Builder()

    // Filter by content-type
    query.filter(q -> q
      .match(m -> m
        .field("content-type")
        .query(v -> v
          .stringValue(ITEM_NEW_CONTENT_TYPE)
        )
      )
    )

    // Filter by path to only get items from /list-blog directory
    query.filter(q -> q
      .wildcard(w -> w
        .field("localId")
        .value("*" + LIST_BLOG_PATH + "*")
      )
    )

    SearchRequest request = SearchRequest.of(r -> r
      .query(query.build()._toQuery())
      .from(start)
      .size(rows)
      .sort(s -> s
        .field(f -> f
          .field("createdDate_dt")
          .order(SortOrder.Desc)
        )
      )
    )

    def result = searchClient.search(request, Map)

    if (result) {
      return processNewsListingResults(result)
    } else {
      return []
    }
  }

  def getNewsByCategory(categories, start = DEFAULT_START, rows = DEFAULT_ROWS) {
    def query = new BoolQuery.Builder()

    // Filter by content-type
    query.filter(q -> q
      .match(m -> m
        .field("content-type")
        .query(v -> v
          .stringValue(ITEM_NEW_CONTENT_TYPE)
        )
      )
    )

    // Filter by path to only get items from /list-blog directory
    query.filter(q -> q
      .wildcard(w -> w
        .field("localId")
        .value("*" + LIST_BLOG_PATH + "*")
      )
    )

    if (categories) {
      // Filter by categories
      query.filter(getFieldQueryWithMultipleValues("categorys_o.item.key", categories))
    }

    SearchRequest request = SearchRequest.of(r -> r
      .query(query.build()._toQuery())
      .from(start)
      .size(rows)
      .sort(s -> s
        .field(f -> f
          .field("createdDate_dt")
          .order(SortOrder.Desc)
        )
      )
    )

    def result = searchClient.search(request, Map)

    if (result) {
      return processNewsListingResults(result)
    } else {
      return []
    }
  }

  private def processNewsSearchResults(result) {
    def news = []
    def hits = result.hits().hits()

    if (hits) {
      hits.each {hit ->
        def doc = hit.source()
        def newsItem = [:]
        newsItem.id = doc.objectId
        newsItem.objectId = doc.objectId
        newsItem.path = doc.localId
        newsItem.title = doc.title_vi_s ?: doc.title_en_s
        newsItem.title_vi = doc.title_vi_s
        newsItem.title_en = doc.title_en_s
        newsItem.content_vi = doc.content_vi_html
        newsItem.content_en = doc.content_en_html
        newsItem.internal_name = doc.internal_name
        newsItem.nav_label = doc.navLabel
        newsItem.url = urlTransformationService.transform("storeUrlToRenderUrl", doc.localId)
        newsItem.created_date = convertToHanoiTimeString(doc.createdDate_dt)
        newsItem.last_modified_date = convertToHanoiTimeString(doc.lastModifiedDate_dt)
        newsItem.img_main_s = doc.img_main_s

        // Extract categories
        if (doc.categorys_o && doc.categorys_o.item) {
          newsItem.categories = []
          if (doc.categorys_o.item instanceof List) {
            doc.categorys_o.item.each { category ->
              newsItem.categories << category.key
            }
          } else {
            newsItem.categories << doc.categorys_o.item.key
          }
        }

        if (hit.highlight()) {
          def newsHighlights = hit.highlight().values()
          if (newsHighlights) {
            def highlightValues = []

            newsHighlights.each { value ->
              highlightValues.addAll(value)
            }

            newsItem.highlight = StringUtils.join(highlightValues, "... ")
            newsItem.highlight = StringUtils.strip(newsItem.highlight)
          }
        }

        news << newsItem
      }
    }

    return news
  }

  private def processNewsListingResults(result) {
    def news = []
    def documents = result.hits().hits()*.source()

    if (documents) {
      documents.each {doc ->
        def newsItem = [:]
        newsItem.id = doc.objectId
        newsItem.objectId = doc.objectId
        newsItem.path = doc.localId
        newsItem.storeUrl = doc.localId
        newsItem.title = doc.title_vi_s ?: doc.title_en_s
        newsItem.title_vi = doc.title_vi_s
        newsItem.title_en = doc.title_en_s
        newsItem.content_vi = doc.content_vi_html
        newsItem.content_en = doc.content_en_html
        newsItem.internal_name = doc.internal_name
        newsItem.nav_label = doc.navLabel
        newsItem.url = urlTransformationService.transform("storeUrlToRenderUrl", doc.localId)
        newsItem.created_date = convertToHanoiTimeString(doc.createdDate_dt)
        newsItem.last_modified_date = convertToHanoiTimeString(doc.lastModifiedDate_dt)
        newsItem.img_main_s = doc.img_main_s

        // Extract categories
        if (doc.categorys_o && doc.categorys_o.item) {
          newsItem.categories = []
          if (doc.categorys_o.item instanceof List) {
            doc.categorys_o.item.each { category ->
              newsItem.categories << category.key
            }
          } else {
            newsItem.categories << doc.categorys_o.item.key
          }
        }

        news << newsItem
      }
    }

    return news
  }

  private Query getFieldQueryWithMultipleValues(field, values) {
    if (values.class.isArray()) {
      values = values as List
    }

    if (values instanceof Iterable) {
      values = StringUtils.join((Iterable)values, " ") as String
    } else {
      values = values as String
    }

    return Query.of(q -> q
      .match(m -> m
        .field(field)
        .query(v -> v
          .stringValue(values)
        )
        .analyzer(MULTIPLE_VALUES_SEARCH_ANALYZER)
      )
    );
  }

  private def convertToHanoiTimeString(date) {
    if (!date) return ""
    try {
      def utc = (date instanceof String) ? ZonedDateTime.parse(date) : date
      def hanoi = utc.withZoneSameInstant(ZoneId.of("Asia/Bangkok"))
      return hanoi.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"))
    } catch (Exception e) {
      return ""
    }
  }

}
