import org.springframework.http.*
import org.springframework.web.client.RestTemplate
import groovy.json.JsonOutput

println "Processing Contact Us Request with values:"
println params
def result=[:]
result.success = true
return result

def restTemplate = new RestTemplate()
def url = "https://cms-authoring.vnsolutions-io.com/studio/api/2/submit-form"
def headers = new HttpHeaders()
headers.setContentType(MediaType.APPLICATION_JSON)
headers.set("X-Requested-With", "XMLHttpRequest")

// Lấy dữ liệu từ form gửi lên
def data = [:]
params.each { k, v ->
  data[k] = v
}

// Chuyển thành JSON
def body = JsonOutput.toJson(data)
def entity = new HttpEntity<>(body, headers)

def response = restTemplate.exchange(
    url,
    HttpMethod.POST,
    entity,
    String.class
)

// Trả về kết quả cho frontend
return [
  status: response.statusCodeValue,
  body: response.body
]