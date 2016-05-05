//
//  LeftBtn.swift
//  uicnTest
//
//  Created by yozoo on 4/22/16.
//  Copyright © 2016 yozoo. All rights reserved.
//

import UIKit

class LeftBtn: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView!.contentMode = UIViewContentMode.Center
        self.titleLabel!.textAlignment = NSTextAlignment.Center
    }
    
//    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
    
//        let imgX: CGFloat = 0
//        let imgY: CGFloat = (self.frame.size.height-15)/2
////        let imgW: CGFloat = contentRect.size.width
////        let imgH: CGFloat = contentRect.size.height * 0.6
//        
//        return CGRectMake(imgX, imgY, 15, 15)
//    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        return CGRectMake(self.frame.size.width/2, 0, self.frame.size.width, self.frame.size.height)
        
    }


}
