//
//  LeftView.swift
//  uicnTest
//
//  Created by yozoo on 4/22/16.
//  Copyright © 2016 yozoo. All rights reserved.
//

import UIKit

enum MainURL: String {
    case Home = "http://m.ui.cn/"
    case Works = "http://m.ui.cn/works"
    case Study = "http://m.ui.cn/study"
    case Idea = "http://idea.ui.cn/"
}

class LeftView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        var imgAry = ["home","pic","stu","stu"]
        var titleAry = ["首页","作品","学习","灵感"]
        var i = 0
        let count = imgAry.count
        let singleBtnWidth:CGFloat = self.frame.size.width/2
        let singleBtnHight:CGFloat = 88
        
        let imageView = UIImageView(image: UIImage(named: "leftlogo"))
        imageView.frame = CGRectMake(0, 20, self.frame.size.width, 44)
        imageView.contentMode = .Center
        self.addSubview(imageView)
        
        let view = UIView(frame: CGRectMake(0, 64, self.frame.size.width, (CGFloat(count)/2)*singleBtnHight+3))
        view.backgroundColor = UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 1)
        self.addSubview(view)
        for i = 0 ; i < count ;i++ {
            let line = i/2
            let col = i%2
            
            let x:CGFloat = singleBtnWidth*CGFloat(col)
            let y:CGFloat = singleBtnHight*CGFloat(line)+(1*CGFloat(line))
            
            let mySingleBtn = LeftBtn(frame: CGRectMake(x, y+1, singleBtnWidth-1, singleBtnHight))
            mySingleBtn.backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1)
            mySingleBtn.setImage(UIImage(named: imgAry[i]), forState: .Normal)
            mySingleBtn.setTitle(titleAry[i], forState: .Normal)
            mySingleBtn.titleLabel?.font = UIFont.systemFontOfSize(15.0)
            mySingleBtn.tag = i
            
            mySingleBtn.addTarget(self, action: #selector(LeftView.singleViewAction(_:)), forControlEvents: .TouchUpInside)
            view.addSubview(mySingleBtn)
            
        }
    }
    
    func singleViewAction(sender: UIButton){
        var leftUrlStr: String!
        switch sender.tag {
        case 0: leftUrlStr = MainURL.Home.rawValue
        case 1: leftUrlStr = MainURL.Works.rawValue
        case 2: leftUrlStr = MainURL.Study.rawValue
        case 3: leftUrlStr = MainURL.Idea.rawValue
        default: break
            
        }
        NSNotificationCenter.defaultCenter().postNotificationName("leftBtnNotification", object: leftUrlStr)
        self.whereViewControll()?.sideMenuViewController.hideMenuViewController()
    }
    
    func whereViewControll() ->UIViewController?{
        var next:UIView!
        for (next = self.superview; (next != nil); next = next.superview) {
            let nextResponder:UIResponder = next.nextResponder()!
            if nextResponder.isKindOfClass(UIViewController.self){
                return nextResponder as? UIViewController
            }
        }
        return nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
