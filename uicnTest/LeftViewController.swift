//
//  LeftViewController.swift
//  uicnTest
//
//  Created by yozoo on 4/22/16.
//  Copyright © 2016 yozoo. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let leftView = LeftView(frame: CGRectMake(0, 0, 0.75 * UIScreen.mainScreen().bounds.size.width, self.view.frame.size.height))
        leftView.backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1)
        self.view.addSubview(leftView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
