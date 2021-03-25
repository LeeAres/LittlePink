//
//  DiscoveryVC.swift
//  LittlePink
//
//  Created by lee on 2021/3/25.
//

import UIKit
import XLPagerTabStrip
class DiscoveryVC: UIViewController,IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title: "发现")
    }
    

}
