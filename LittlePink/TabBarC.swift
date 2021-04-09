//
//  TabBarC.swift
//  LittlePink
//
//  Created by lee on 2021/3/31.
//

import UIKit
import YPImagePicker

class TabBarC: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is PostVC {
            
            //待做 登录判断
            
            
            var config = YPImagePickerConfiguration()
            // MARK: 通用配置
            config.isScrollToChangeModesEnabled = false
            config.albumName = Bundle.main.appName
            config.startOnScreen = .library
            config.screens = [.library, .video, .photo]
            config.maxCameraZoomFactor = kMaxCameraZoomFactor
            
            // MARK: 相册配置
            config.library.defaultMultipleSelection = true
            config.library.maxNumberOfItems = kMaxPhotoCount
            config.library.spacingBetweenItems = 2
            config.library.skipSelectionsGallery = false
            config.library.preselectedItems = nil
            
            config.gallery.hidesRemoveButton = false
            
            // MARK: 视频配置
            config.video.recordingTimeLimit = 60.0
            config.video.libraryTimeLimit = 60.0
            config.video.minimumTimeLimit = 3.0
            config.video.trimmerMaxDuration = 60.0
            config.video.trimmerMinDuration = 3.0
            
            let picker = YPImagePicker(configuration: config)
            
            picker.didFinishPicking { [unowned picker] items, cancelled in
                if cancelled {
                    print("点击了取消按钮")
                }
                if let photo = items.singlePhoto {
                    print(photo.fromCamera) // Image source (camera or library)
                    print(photo.image) // Final image selected by the user
                    print(photo.originalImage) // original image selected by the user, unfiltered
                }
                picker.dismiss(animated: true, completion: nil)
            }
            present(picker, animated: true, completion: nil)
            
            return false
        }
        
        return true
    }
    
}
