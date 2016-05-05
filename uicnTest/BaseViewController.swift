//
//  BaseViewController.swift
//  uicnTest
//
//  Created by yozoo on 4/22/16.
//  Copyright © 2016 yozoo. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var progressBar: YLProgressBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupLeftButton(isBack isBack: Bool){
        let button = UIButton(type: .Custom)
        if isBack {
            button.setTitle("<", forState: .Normal)
            button.addTarget(self, action: #selector(ViewController.backAction(_:)), forControlEvents: .TouchUpInside)
        }else{
            button.setImage(UIImage(named: "lefButton"), forState: .Normal)
            button.addTarget(self, action: #selector(ViewController.leftAction(_:)), forControlEvents: .TouchUpInside)
            button.imageView!.contentMode = UIViewContentMode.Left
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        }
        button.bounds = CGRectMake(0, 0, 30, isBack ? 30 : button.currentImage!.size.height)
        let menuButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = menuButton
    }
    
    func setupTitleViewAndRightBtn(hasRightButton:Bool, isLogoTitle:Bool, titleStr:String){
        if hasRightButton{
            let button = UIButton(type: .Custom)
            button.setImage(UIImage(named: "user"), forState: .Normal)
            button.addTarget(self, action: #selector(ViewController.rightAction(_:)), forControlEvents: .TouchUpInside)
            button.bounds = CGRectMake(0, 0, 30, button.currentImage!.size.height)
            button.imageView!.contentMode = UIViewContentMode.Right
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }else{
            self.navigationItem.rightBarButtonItem = nil
        }
        
        if isLogoTitle {
            let imageView = UIImageView(image: UIImage(named: "uilogo"))
            self.navigationItem.titleView = imageView
        }else{
            let titleLabel = UILabel(frame: CGRectMake(0,0,UIScreen.mainScreen().bounds.size.width,44))
            titleLabel.textColor = UIColor.whiteColor()
            titleLabel.textAlignment = .Center
            
            let subRange = titleStr.rangeOfString("UI中国—移动版")
            var labelSize:CGFloat = 20.0
            if subRange != nil {
                titleLabel.text = (titleStr as NSString).substringFromIndex(9)
                labelSize = 20.0
            }else{
                titleLabel.text = titleStr
                labelSize = 14.0
            }
            titleLabel.font = UIFont(name: "Helvetica Neue", size: labelSize)
            self.navigationItem.titleView = titleLabel
        }
        
    }
    
    func setupProgressBar(){
        progressBar = YLProgressBar(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 4))
        progressBar.type = .Flat
        progressBar.indicatorTextDisplayMode = .None
        progressBar.behavior = .Indeterminate
        progressBar.stripesOrientation = .Vertical
        
        self.view.addSubview(progressBar)
    }
    
    
    // MARK: - Action
    func leftAction(sender: UIButton){
        self.sideMenuViewController.presentLeftMenuViewController()
    }

}
