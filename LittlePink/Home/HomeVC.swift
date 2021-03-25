//
//  HomeVC.swift
//  LittlePink
//
//  Created by lee on 2021/3/25.
//

import UIKit
import XLPagerTabStrip

class HomeVC: ButtonBarPagerTabStripViewController {

    
    override func viewDidLoad() {
        settings.style.selectedBarBackgroundColor = UIColor(named: "main")!
        settings.style.selectedBarHeight = 3
        
        super.viewDidLoad()
        
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let followVC = storyboard!.instantiateViewController(identifier: kFollowVCID)
        let nearByVC = storyboard!.instantiateViewController(identifier: kNearByVCID)
        let discoverVC = storyboard!.instantiateViewController(identifier: kDiscoveryVCID)
        return [followVC, nearByVC, discoverVC]
    }
    

}
