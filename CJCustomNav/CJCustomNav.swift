//
//  CJCustomNav.swift
//  TestSwiftUI
//
//  Created by user on 2017/4/26.
//  Copyright © 2017年 Annie Hou. All rights reserved.
//

import UIKit
// MARK: - 自定义导航栏代理
protocol CustomNavDelegate:NSObjectProtocol {
    func leftBtnClicked()
    func rightBtnClicked()
}

class CJCustomNav: UIView {
    
    weak var delegate:CustomNavDelegate?
    
    lazy var leftBtn:UIButton = {
        let leftBtn = UIButton.init(frame: CGRect(x: 0, y: 20, width: 40, height: 40))
        leftBtn.backgroundColor = UIColor.red
        
        return leftBtn
    }()
    lazy var rightBtn:UIButton = {
        let rightBtn = UIButton.init(frame: CGRect(x: WIDTH-40, y: 20, width: 40, height: 40))
        rightBtn.backgroundColor = UIColor.red
        
        return rightBtn
    }()
    lazy var titleLabel:UILabel = {
        let titleLabel = UILabel.init(frame: CGRect(x: 40, y: 20, width: WIDTH - 80, height: 40))
        titleLabel.textAlignment = NSTextAlignment.center
        return titleLabel
    }()
    lazy var bottomView:UIView = {
        let bottomView = UIView.init(frame: CGRect(x: 0, y: 63, width: WIDTH, height: 1))
        bottomView.backgroundColor = COLOR_GREY_V2()
        return bottomView
    }()
    
    
    
    func leftBtnClick() -> Void {
        self.delegate?.leftBtnClicked()
    }
    func rightBtnClick() -> Void {
        self.delegate?.rightBtnClicked()
    }
    
    
    func customNav(left:UIImage?, title:String, right:UIImage?) -> Void {
//        let view = CJCustomNav.init(frame: CGRect(x: 0, y: 0, width: WIDTH, height: 64))
//        view.backgroundColor = UIColor.white
        
        leftBtn.setImage(left, for: UIControlState.normal)
        rightBtn.setImage(right, for: UIControlState.normal)
        titleLabel.text = title
        
        leftBtn.addTarget(self, action:#selector(leftBtnClick), for: UIControlEvents.touchUpInside)
        
        rightBtn.addTarget(self, action: #selector(rightBtnClick), for: UIControlEvents.touchUpInside)
        
        self.addSubview(bottomView)
        self.addSubview(leftBtn)
        self.addSubview(rightBtn)
        self.addSubview(titleLabel)
        
//        return self
    }
    
}

