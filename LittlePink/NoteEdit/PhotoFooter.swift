//
//  PhotoFooter.swift
//  LittlePink
//
//  Created by lee on 2021/4/7.
//

import UIKit

class PhotoFooter: UICollectionReusableView {
        
    @IBOutlet weak var addPhotoBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addPhotoBtn.layer.cornerRadius = 10
        addPhotoBtn.layer.borderWidth = 1
        addPhotoBtn.layer.borderColor = UIColor.tertiaryLabel.cgColor
    }
}
