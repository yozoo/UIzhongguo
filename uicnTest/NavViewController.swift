//
//  NavViewController.swift
//  uicnTest
//
//  Created by yozoo on 4/22/16.
//  Copyright © 2016 yozoo. All rights reserved.
//

import UIKit

class NavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let navBar: UINavigationBar = UINavigationBar.appearance()
        
        navBar.setBackgroundImage(UIImage(named: "nav"), forBarPosition: UIBarPosition.Top, barMetrics: .Default)
        navBar.shadowImage = UIImage()
        navBar.tintColor = UIColor.whiteColor()
        
//        // 设置标题字体
//        var titleAttr = [String : AnyObject]()
//        titleAttr[NSForegroundColorAttributeName] = UIColor.whiteColor()
//        titleAttr[NSFontAttributeName] = UIFont.systemFontOfSize(18)
//        
//        navBar.titleTextAttributes = titleAttr

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
