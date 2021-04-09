//
//  Extensions.swift
//  LittlePink
//
//  Created by lee on 2021/3/31.
//

import UIKit

extension UITextField{
    var unwrappedText: String { text ?? ""}
    
}

extension UIView{
    @IBInspectable
    var radius: CGFloat{
        get{
            layer.cornerRadius
        }
        
        set{
            layer.cornerRadius = newValue
        }
    }
    
}

extension Bundle{
    var appName :String{
        if let appName = localizedInfoDictionary?["CFBundleDisplayName"] as? String {
            return appName
        }else{
            return infoDictionary!["CFBundleDisplayName"] as! String
        }
    }
}

extension UIViewController{
    //MARK: - 提示框--自动隐藏
    func showTextHUD(_ title: String, _ subTitle: String? = nil){
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text
        hud.label.text = title
        hud.detailsLabel.text = subTitle
        hud.hide(animated: true, afterDelay: 2)
    }
    
    func hideKeyboardWhenTappedAround(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyBoard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dissmissKeyBoard(){
        view.endEditing(true)
    }
}
