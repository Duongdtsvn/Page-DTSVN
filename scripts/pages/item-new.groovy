import scripts.libs.CommonLifecycleApi

// Nếu path kết thúc bằng .en thì bỏ .en để lấy file gốc
def realPath = path
if (realPath.endsWith('.en')) {
    realPath = realPath.substring(0, realPath.length() - 3)
}

def contentLifecycleParams = [:]
contentLifecycleParams.site = site
contentLifecycleParams.path = realPath
contentLifecycleParams.user = user
contentLifecycleParams.contentType = contentType
contentLifecycleParams.contentLifecycleOperation = contentLifecycleOperation
contentLifecycleParams.contentLoader = contentLoader
contentLifecycleParams.applicationContext = applicationContext

def controller = new CommonLifecycleApi(contentLifecycleParams)
controller.execute()