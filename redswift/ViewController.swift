//
//  ViewController.swift
//  redswift
//
//  Created by Colin Moore on 14/04/2015.
//  Copyright (c) 2015 dirtyrect. All rights reserved.
//

import UIKit
import WebKit

let kHEADERHEIGHT : CGFloat = 44.0
let kFOOTERHEIGHT : CGFloat = 44.0

class ViewController: UIViewController, WKNavigationDelegate {

  var webView : WKWebView = WKWebView()
    var headerView : UIView = UIView()
    var footerView : UIView = UIView()
    var leftArrowButton  = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    var rightArrowButton  = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
    var listButton  = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
     
    override func viewDidLoad() {
        super.viewDidLoad()
         
        webView.allowsBackForwardNavigationGestures = true
        self.view.backgroundColor = UIColor.whiteColor()
        self.headerView.backgroundColor = UIColor.grayColor()
        self.footerView.backgroundColor = UIColor.grayColor()
         
        self.view.addSubview(self.headerView)
        self.view.addSubview(self.webView)
        self.view.addSubview(self.footerView)
         
        self.webView.navigationDelegate = self
        // Local File with simple javacript
       // self.webView.loadRequest(NSURLRequest(URL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("index", ofType: "html")!)!))
       self.webView .loadRequest(NSURLRequest(URL: NSURL(string: "http://google.com.sg")!))
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    override func viewWillLayoutSubviews() {
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        self.headerView.frame = CGRectMake(0, statusBarHeight, self.view.frame.size.width, kHEADERHEIGHT)
        self.webView.frame = CGRectMake(0, statusBarHeight+kHEADERHEIGHT, self.view.frame.size.width, self.view.frame.size.height - (statusBarHeight+kHEADERHEIGHT) - kFOOTERHEIGHT)
        self.footerView.frame = CGRectMake(0, self.view.frame.size.height - kFOOTERHEIGHT, self.view.frame.size.width, kFOOTERHEIGHT)
    }
     
    // MARK: WKNavigationDelegate
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        NSLog("Start")
    }
     
    func webView(webView: WKWebView!, didFailNavigation navigation: WKNavigation!, withError error: NSError!) {
        NSLog("Failed Navigation %@", error.localizedDescription)
    }
     
    func webView(webView: WKWebView!, didFinishNavigation navigation: WKNavigation!) {
        // Finish navigation
        NSLog("Finish Navigation")
        NSLog("Title:%@ URL:%@", webView.title!, webView.URL!)
         
        // Run Javascript(For local)
        webView.evaluateJavaScript("var el=document.getElementById('user');el.style.backgroundColor='yellow';", completionHandler: nil)
    }

}

