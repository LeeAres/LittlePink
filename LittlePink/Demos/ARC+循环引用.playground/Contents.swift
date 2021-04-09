import UIKit

//ARC
//内存管理机制
//循环引用
//解决方法 weak unowned
class Author{
    var name: String
    weak var video: Video?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
      print("Author对象销毁")
    }
}


class Video{
    unowned var author: Author
    
    init(author:Author) {
        self.author = author
    }
    
    deinit {
      print("Video对象销毁")
    }
}

var author: Author? = Author(name: "Lee")
var video: Video? = Video(author: author!)
author?.video = video

author = nil
video = nil

