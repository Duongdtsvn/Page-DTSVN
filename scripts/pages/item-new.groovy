// Nếu path kết thúc bằng .en thì bỏ .en để lấy file gốc
def realPath = path
if (realPath.endsWith('.en')) {
    realPath = realPath.substring(0, realPath.length() - 3)
}

// Lấy content object từ contentModelService (API mặc định của CrafterCMS)
def content = contentModelService.getContentObject(site, realPath)
return [contentModel: content]