//
//  NoteEditVC-CollectionView.swift
//  LittlePink
//
//  Created by lee on 2021/4/8.
//

import Foundation
import YPImagePicker
import SKPhotoBrowser
import AVKit


extension NoteEditVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPhotoCellID, for: indexPath) as! PhotoCell
        cell.imageView.image = photos[indexPath.item]
        cell.contentView.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let photoFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kPhotoFooterID, for: indexPath) as! PhotoFooter
//        return photoFooter
        
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            let photoFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kPhotoFooterID, for: indexPath) as! PhotoFooter
            photoFooter.addPhotoBtn.addTarget(self, action:#selector(addPhoto) , for: .touchUpInside)
            return photoFooter
        default:
            fatalError("collectionView的footer出问题了")
        }
    }
}

extension NoteEditVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if isVideo {
            let playerVC = AVPlayerViewController()
            playerVC.player = AVPlayer(url: videoURL!)
            present(playerVC, animated: true) {
                playerVC.player?.play()
            }
        }
        
        // 1. create SKPhoto Array from UIImage
        var images: [SKPhoto] = []
        
        for photo in photos {
            images.append(SKPhoto.photoWithImage(photo))
        }

        // 2. create PhotoBrowser Instance, and present from your viewController.
        let browser = SKPhotoBrowser(photos: images, initialPageIndex: indexPath.item)
        SKPhotoBrowserOptions.displayAction = false
        SKPhotoBrowserOptions.displayDeleteButton = true
        browser.delegate = self
        
        present(browser, animated: true, completion: {})
    }
}


extension NoteEditVC: SKPhotoBrowserDelegate{
    func removePhoto(_ browser: SKPhotoBrowser, index: Int, reload: @escaping (() -> Void)) {
        photos.remove(at: index)
        photoCollectionView.reloadData()
        reload()
    }
}




// MARK: - 监听
extension NoteEditVC{
    @objc private func addPhoto(){
        if photoCount < kMaxPhotoCount {
            
            var config = YPImagePickerConfiguration()
            // MARK: 通用配置

            config.albumName = Bundle.main.appName
            config.screens = [.library]
            
            // MARK: 相册配置
            config.library.defaultMultipleSelection = true
            config.library.maxNumberOfItems = kMaxPhotoCount - photoCount
            config.library.spacingBetweenItems = 2
            
            config.gallery.hidesRemoveButton = false
            
            
            let picker = YPImagePicker(configuration: config)
            
            picker.didFinishPicking { [unowned picker] items, _ in

                for item in items {
                    if case let .photo(photo) = item{
                        self.photos.append(photo.image)
                    }
                }
                self.photoCollectionView.reloadData()
                
                picker.dismiss(animated: true)
            }
            present(picker, animated: true)
        }else{
            showTextHUD("最多只能选择\(kMaxPhotoCount)张照片哦")
        }
    }
}
