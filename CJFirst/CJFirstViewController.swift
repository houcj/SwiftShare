//
//  CJFirstViewController.swift
//  TestSwiftUI
//
//  Created by user on 2017/4/20.
//  Copyright © 2017年 Annie Hou. All rights reserved.
//

import UIKit
func COLOR_GREY() -> UIColor {
    return UIColor.init(colorLiteralRed: 165/255.0, green: 165/255.0, blue: 165/255.0, alpha: 1.0)
}
func COLOR_GREY_V2() -> UIColor {
    return UIColor.init(colorLiteralRed: 244/255.0, green: 244/255.0, blue: 244/255.0, alpha: 1.0)
}

class CJFirstViewController: UIViewController,CustomNavDelegate {

    lazy var label0:UILabel = {
        let label0 = UILabel.init(frame: CGRect(x: 20, y: 0, width: WIDTH - 40, height: 60))
        label0.text = "选择缴费单位：  云南电网有限责任公司"
        label0.textColor = COLOR_GREY()
        return label0
    }()
    
    lazy var view0:UIView = {
        let view0 = UIView.init(frame: CGRect(x: 0, y: self.nav.frame.maxY, width: WIDTH, height: 60))
        view0.backgroundColor = UIColor.white
        return view0
    }()
    
    lazy var label1:UILabel = {
        let label1 = UILabel.init(frame: CGRect(x: 20, y: 0, width: 100, height: 60))
        label1.textColor = COLOR_GREY()
        label1.text = "客户编号："
        return label1
    }()
    
    lazy var  codeTextFiled:UITextField = {
        let codeTextFiled = UITextField.init(frame: CGRect(x: self.label1.frame.maxX, y: 0, width: WIDTH - self.label1.frame.maxX, height: 60))
        codeTextFiled.keyboardType = UIKeyboardType(rawValue: 4)!
        return codeTextFiled
    }()
    
    lazy var view1:UIView = {
        let view1 = UIView.init(frame: CGRect(x: 0, y: self.view0.frame.maxY + 1, width: WIDTH, height: 60))
        view1.backgroundColor = UIColor.white
        return view1
    }()
    
    lazy var bottomBtn:UIButton = {
        let bottomBtn = UIButton.init(frame: CGRect(x: 20, y: self.view1.frame.maxY + 100, width: WIDTH - 40, height: 50))
        bottomBtn.backgroundColor = COLOR_RED_V2()
        bottomBtn.setTitle("查询账单", for: .normal)
        bottomBtn.addTarget(self, action: #selector(bottomBtnClicked(btn:)), for: .touchUpInside)
        bottomBtn.layer.masksToBounds = true
        bottomBtn.layer.cornerRadius = 10.0
        return bottomBtn
    }()
    
    lazy var nav:CJCustomNav = {

        let nav = CJCustomNav(frame: CGRect(x: 0, y: 0, width: WIDTH, height: 64))
        nav.customNav(left: UIImage.init(named: "交易详情.jpg"), title: "", right: UIImage.init(named: ""))
        nav.delegate = self
        
        return nav
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = COLOR_GREY_V2()
        
        self.view.addSubview(self.nav)
        
        self.view0.addSubview(self.label0)
        self.view1.addSubview(self.label1)
        self.view1.addSubview(self.codeTextFiled)
        self.view.addSubview(self.view0)
        self.view.addSubview(self.view1)
        self.view.addSubview(self.bottomBtn)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func bottomBtnClicked(btn:UIButton) -> Void {
        
    }
    
    func leftBtnClicked() -> Void {
        self.navigationController?.popViewController(animated: true)
    }
    func rightBtnClicked() -> Void {
        print("rightBtnClicked")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
