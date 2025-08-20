<#import "/templates/system/common/crafter.ftl" as crafter />
<#if menu.submenu_o.item?? && menu.submenu_o.item?has_content>
            <ul class="submenu">
              <#list menu.submenu_o.item as submenu>
                <li>
                  <a href="${submenu.link_s!''}">${submenu.menu_s!''}</a>
                </li>
              </#list>
            </ul>
         </#if>