//
//  ViewController.swift
//  TestSwiftUI
//
//  Created by user on 2017/4/20.
//  Copyright © 2017年 Annie Hou. All rights reserved.
//

import UIKit

func IS_IOS7() -> Bool {
    let deviceSystem:Double = Double(UIDevice.current.systemVersion)!
    if deviceSystem >= 7.0 {
        return true
    }
    return false
}

let WIDTH = UIScreen.main.bounds.size.width
let HEIGHT = UIScreen.main.bounds.size.height

class ViewController: UIViewController,CJHomeViewBtnDelegate {

    lazy var bankScrollerView: UIScrollView = {
        let bankScrollerView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: 375, height: 667))
        bankScrollerView.isScrollEnabled = false
        return bankScrollerView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.creatBtnView()
        
        
        
        
    }
    
    func homeBtnClicked() {
        let firstVC = CJFirstViewController()
        self.present(firstVC, animated: true, completion: nil)
        
    }
    
    func createTableView() {
        var tabelView = UITableView()
    }
    
    func creatBtnView() {
        let firstView = CJHomeViewBtn()
        firstView.delegate = self
        firstView.frame = CGRect(x: 40, y: 40, width: WIDTH - 80, height: 100)
        self.view.addSubview(firstView)
        
        let secondView = CJHomeViewBtn()
        secondView.frame = CGRect(x: 40, y: firstView.frame.maxY + 40, width: WIDTH - 80, height: 100)
        self.view.addSubview(secondView)
        
        let thirdView = CJHomeViewBtn()
        thirdView.frame = CGRect(x: 40, y: 320, width: WIDTH - 80, height: 100)
        self.view.addSubview(thirdView)
        
        let fourView = CJHomeViewBtn()
        fourView.frame = CGRect(x: 40, y: 460, width: WIDTH - 80, height: 100)
        self.view.addSubview(fourView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

