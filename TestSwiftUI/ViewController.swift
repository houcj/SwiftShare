//
//  ViewController.swift
//  TestSwiftUI
//
//  Created by user on 2017/4/20.
//  Copyright © 2017年 Annie Hou. All rights reserved.
//

import UIKit
import WebKit

func IS_IOS7() -> Bool {
    let deviceSystem:Double = Double(UIDevice.current.systemVersion)!
    if deviceSystem >= 7.0 {
        return true
    }
    return false
}

func COLOR_RED_V2() -> UIColor {
    return UIColor.init(colorLiteralRed: 235/255.0, green: 85/255.0, blue: 68/255.0, alpha: 1.0)
}

func navTitle(title:String, color:UIColor) -> UIView {
    let label = UILabel(frame:(CGRect(x: (WIDTH-200)/2, y: 0, width: 200, height: 40)))

    label.text = title
    label.textColor = UIColor.black
    label.font = UIFont.boldSystemFont(ofSize: 20.0)
    label.textAlignment = NSTextAlignment.center
    
    return label
    
}

let WIDTH = UIScreen.main.bounds.size.width
let HEIGHT = UIScreen.main.bounds.size.height

class ViewController: UIViewController,CJHomeViewBtnDelegate,WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler/*实现js和swift交互*/{

    lazy var webView:WKWebView = {
        
        // MARK: 配置js
        let userContentController = WKUserContentController.init()
        userContentController.add(self, name: "jsCallSwift")
        
        // MARK: 配置WKWebView
        let configuration = WKWebViewConfiguration.init()
        
        // MARK: 显示WebView
        let webView = WKWebView.init(frame: CGRect(x:0, y:0, width:WIDTH, height:HEIGHT), configuration: configuration)
        webView.backgroundColor = UIColor.red
        webView.uiDelegate = self
        webView.isUserInteractionEnabled = true
        webView.navigationDelegate = self
        
        let urlRe = URLRequest.init(url:URL.init(string: "http://communication-service-v1.b2b.gznb.com")!)
//        let urlRe = URLRequest.init(url:URL.init(string: "www.sina.com.cn")!)
//        let urlRe = URLRequest.init(url:URL.init(string: "https://www.baidu.com")!)
        
        webView.load(urlRe)
        //写入次方法，必须有监听的对象
//        webView.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)
//        webView.addObserver(self, forKeyPath: "title", options: NSKeyValueObservingOptions.new, context: nil)
        
        return webView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        self.navigationController?.navigationBar.isHidden = false
//        self.navigationItem.titleView = navTitle(title: "国资代办", color: COLOR_GREY())
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
//        self.view.addSubview(self.webView)
        self.creatBtnView()
        
    }
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("调度器和方法--\(message)")
    }
    
    
    
    
    
    
    // MARK: 调用web view方法，实现web view界面
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        
    }
    // MARK: 在发送请求之前，决定是否跳转
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        var urlStr = navigationAction.request.url?.absoluteString
        urlStr = urlStr?.removingPercentEncoding
        let urlComps = urlStr?.components(separatedBy: "://")
        if ((urlComps?.count) != nil) {
            let protocolHead = urlComps?[0]
            print("protocolHead=\(String(describing: protocolHead))")
            
        }
        decisionHandler(WKNavigationActionPolicy.allow)
        
    }
    // MARK: 页面开始加载
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("didStartProvisional-\(#function)")
    }
    // MARK: 收到服务器的响应头，根据respondse相关信息，决定是否跳转，参数WKNavigationActionPolicyCancel取消跳转，WKNavigationActionPolicyAllow允许跳转
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        decisionHandler(WKNavigationResponsePolicy.allow)
    }
    // MARK: 开始获取网页内容时返回
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    // MARK: 网页加载完成时调用
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    // MARK: 网页加载失败时调用
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
    
    
    
    
    
    
    
    
    // MARK: - 原生界面
    
    lazy var bankScrollerView: UIScrollView = {
        let bankScrollerView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: 375, height: 667))
        bankScrollerView.isScrollEnabled = false
        return bankScrollerView
    }()
    
    func homeBtnClicked(tag:NSInteger){
        switch tag {
        case 10:
            let firstVC = CJFirstViewController()
            self.navigationController?.pushViewController(firstVC, animated: true)
        case 11:
            let secondVC = CJSecondViewController()
            self.navigationController?.pushViewController(secondVC, animated: true)
        case 12:
            let thirdVC = CJThirdViewController()
            self.navigationController?.pushViewController(thirdVC, animated: true)
        case 13:
            let secondVC = CJSecondViewController()
            self.navigationController?.pushViewController(secondVC, animated: true)
        default: break
        }
        
    }
    
    func creatBtnView() {
        let firstView = CJHomeViewBtn()
        firstView.delegate = self
        firstView.frame = CGRect(x: 40, y: 40, width: WIDTH - 80, height: 100)
        firstView.btn.tag = 10
        self.view.addSubview(firstView)
        
        let secondView = CJHomeViewBtn()
        secondView.delegate = self
        secondView.frame = CGRect(x: 40, y: firstView.frame.maxY + 40, width: WIDTH - 80, height: 100)
        secondView.btn.tag = 11
        self.view.addSubview(secondView)
        
        let thirdView = CJHomeViewBtn()
        thirdView.delegate = self
        thirdView.frame = CGRect(x: 40, y: 320, width: WIDTH - 80, height: 100)
        thirdView.btn.tag = 12
        self.view.addSubview(thirdView)
        
        let fourView = CJHomeViewBtn()
        fourView.delegate = self
        fourView.frame = CGRect(x: 40, y: 460, width: WIDTH - 80, height: 100)
        fourView.btn.tag = 13
        self.view.addSubview(fourView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

