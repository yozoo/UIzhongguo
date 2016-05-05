//
//  ViewController.swift
//  uicnTest
//
//  Created by yozoo on 4/22/16.
//  Copyright © 2016 yozoo. All rights reserved.
//

import UIKit
import Foundation
import WebKit

// MARK: - ViewController
class ViewController: BaseViewController , WKNavigationDelegate {

//    var delegate: homeVCDelegate!
    var webView: WKWebView!
    var leftView: UIView!
    var loadingView: RZSquaresLoading!
    var urlStr: String!
    ///是否允许缩放效果
    var allowTransformWithScale = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLeftButton(isBack: false)
        setupTitleViewAndRightBtn(true, isLogoTitle: true, titleStr: "")
        self.setupWebView()
        loadingView = RZSquaresLoading(frame: CGRectMake((self.view.frame.size.width-80)/2, (self.view.frame.size.height-80)/2, 80, 80))
        self.view.addSubview(loadingView)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.seturlStr(_:)), name: "leftBtnNotification", object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupWebView(){
        let config = WKWebViewConfiguration()
        //加载本地js文件
        let scriptURL = NSBundle.mainBundle().pathForResource("myjs", ofType: "js")
        
        //        let scriptContent = String(contentsOfFile:scriptURL!, encoding:NSUTF8StringEncoding, error: nil)
        let scriptContent = try! String(contentsOfFile: scriptURL!, encoding: NSUTF8StringEncoding)
        
        
        let script = WKUserScript(source: scriptContent, injectionTime: .AtDocumentStart, forMainFrameOnly: true)
        
        config.userContentController.addUserScript(script)
        
        self.webView = WKWebView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height-64), configuration: config)
        
        self.webView.navigationDelegate = self
        
        self.webView.loadRequest(NSURLRequest(URL: NSURL(string: MainURL.Home.rawValue)!))

        self.view.addSubview(self.webView)
    }
    
    func seturlStr(url: NSNotification){
        urlStr = url.object as! String
        //打印当前url
//        print("\(self.webView.URL)")
        //新的url不为空且跟当前的不一样
        if url.object != nil && self.webView.URL?.absoluteString != urlStr {
            //加载新的url
            self.webView.loadRequest(NSURLRequest(URL: NSURL(string: urlStr)!))
        }
        
    }
    
    func rightAction(sender: UIButton){
        print("->")
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "estimatedProgress"{
            if loadingView != nil{
                loadingView.alpha = 1 - CGFloat(self.webView.estimatedProgress)
            }
            if progressBar != nil{
                progressBar.setProgress(CGFloat(self.webView.estimatedProgress), animated: true)
            }
        }
        if keyPath == "title"{
            if self.webView.URL?.absoluteString == MainURL.Home.rawValue{
                if self.navigationItem.leftBarButtonItem != nil{
                    self.navigationItem.leftBarButtonItem = nil
                }
                setupLeftButton(isBack: false)
                if self.navigationItem.rightBarButtonItem == nil{
                    setupTitleViewAndRightBtn(true, isLogoTitle: true, titleStr: self.webView.title!)
                }
                let imageView = UIImageView(image: UIImage(named: "uilogo"))
                self.navigationItem.titleView = imageView
            }else if (self.webView.URL?.absoluteString == MainURL.Study.rawValue) || (self.webView.URL?.absoluteString == MainURL.Works.rawValue) || (self.webView.URL?.absoluteString == MainURL.Idea.rawValue){
                self.navigationItem.rightBarButtonItem = nil
                if self.navigationItem.rightBarButtonItem == nil{
                    setupTitleViewAndRightBtn(true, isLogoTitle: false, titleStr: self.webView.title!)
                }
                if self.navigationItem.leftBarButtonItem != nil{
                    self.navigationItem.leftBarButtonItem = nil
                }
                setupLeftButton(isBack: false)
                
                
            }else{
                setupLeftButton(isBack: true)
                
                let webTitle:String = self.webView.title!
                setupTitleViewAndRightBtn(false, isLogoTitle: false, titleStr: webTitle)
                
                self.navigationItem.rightBarButtonItem = nil
            }
        }
        
    }
    
    func backAction(sender: UIButton){
        self.webView.goBack()
    }

}

// MARK: ViewController -
private typealias wkNavigationDelegate = ViewController
extension wkNavigationDelegate {
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!){

        if progressBar == nil{
            setupProgressBar()
        }
        //监听进度和标题的变化
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil)
        self.webView.addObserver(self, forKeyPath: "title", options: .New, context: nil)
    }
    //加载完成
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!){
        loadingView.removeFromSuperview()
        if progressBar != nil{
            self.progressBar.removeFromSuperview()
            progressBar = nil
        }
        self.webView.removeObserver(self, forKeyPath: "estimatedProgress")
        self.webView.removeObserver(self, forKeyPath: "title")
    }
    // MARK: - 加载错误处理
    func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError) {
        NSLog(error.debugDescription)
        loadingView.removeFromSuperview()
        if progressBar != nil{
            self.progressBar.removeFromSuperview()
            progressBar = nil
        }
//        loadingView.removeFromSuperview()
    }
    func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        NSLog(error.debugDescription)
        loadingView.removeFromSuperview()
    }
    
    func webView(webView: WKWebView, didCommitNavigation navigation: WKNavigation!){
        
    }
}
