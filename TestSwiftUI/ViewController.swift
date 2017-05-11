//
//  ViewController.swift
//  TestSwiftUI
//
//  Created by user on 2017/4/20.
//  Copyright © 2017年 Annie Hou. All rights reserved.
//

import UIKit
import WebKit

//宏定义系统
func IS_IOS7() -> Bool {
    let deviceSystem:Double = Double(UIDevice.current.systemVersion)!
    if deviceSystem >= 7.0 {
        return true
    }
    return false
}

//宏定义颜色
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

class ViewController: UIViewController,CJHomeViewBtnDelegate{
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.titleView = navTitle(title: "友盟分享", color: COLOR_GREY())
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.addSubview(self.webView)
        self.creatBtnView()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - 原生界面
    // bankScrollerView懒加载
//    lazy var bankScrollerView: UIScrollView = {
//        let bankScrollerView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: 375, height: 667))
//        bankScrollerView.isScrollEnabled = false
//        return bankScrollerView
//    }()
    
    func homeBtnClicked(tag:NSInteger){
        switch tag {
        case 10:
//            let firstVC = CJFirstViewController()
//            self.navigationController?.pushViewController(firstVC, animated: true)
            //  MARC: -----调起分享面板
            self.bottomBtnClicked();
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
        firstView.frame = CGRect(x: 40, y: (HEIGHT - 100)/2, width: WIDTH - 80, height: 100)
        firstView.btn.tag = 10
        self.view.addSubview(firstView)
        
//        let secondView = CJHomeViewBtn()
//        secondView.delegate = self
//        secondView.frame = CGRect(x: 40, y: firstView.frame.maxY + 40, width: WIDTH - 80, height: 100)
//        secondView.btn.tag = 11
//        self.view.addSubview(secondView)
//        
//        let thirdView = CJHomeViewBtn()
//        thirdView.delegate = self
//        thirdView.frame = CGRect(x: 40, y: 320, width: WIDTH - 80, height: 100)
//        thirdView.btn.tag = 12
//        self.view.addSubview(thirdView)
//        
//        let fourView = CJHomeViewBtn()
//        fourView.delegate = self
//        fourView.frame = CGRect(x: 40, y: 460, width: WIDTH - 80, height: 100)
//        fourView.btn.tag = 13
//        self.view.addSubview(fourView)
    }
    
    func bottomBtnClicked() -> Void {
        //创建分享消息对象
        
        UMSocialSwiftInterface.setPreDefinePlatforms([
            (UMSocialPlatformType.wechatSession.rawValue),
            (UMSocialPlatformType.wechatTimeLine.rawValue),
            (UMSocialPlatformType.QQ.rawValue),
            (UMSocialPlatformType.qzone.rawValue)
            ])
        
        UMSocialUIManager.removeAllCustomPlatformWithoutFilted()
        UMSocialShareUIConfig.shareInstance().sharePageGroupViewConfig.sharePageGroupViewPostionType = UMSocialSharePageGroupViewPositionType.middle
        UMSocialShareUIConfig.shareInstance().sharePageScrollViewConfig.shareScrollViewPageItemStyleType = UMSocialPlatformItemViewBackgroudType.none
        
        UMSocialSwiftInterface.showShareMenuViewInWindowWithPlatformSelectionBlock { (platformType, userInfo) in
            self.runShareWithType(type: platformType)
        }
    }
    
    
    func runShareWithType(type:UMSocialPlatformType) -> Void {
        print("runShareWithType-----\(type)")
        
        let messageObject = UMSocialMessageObject.init()
        messageObject.text = "终于搞定了，😄\n欢迎使用【友盟+】社会化组件U-Share，SDK包最小，集成成本最低，助力您的产品开发、运营与推广！"
        UMSocialSwiftInterface.share(plattype: type, messageObject: messageObject, viewController: self) { (data, error) in
            if (error != nil) {
                
            }else{
                
            }
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

