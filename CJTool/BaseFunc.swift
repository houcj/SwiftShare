//
//  BaseFunc.swift
//  TestSwiftUI
//
//  Created by user on 2017/4/26.
//  Copyright © 2017年 Annie Hou. All rights reserved.
//

import UIKit

protocol backBtnClickedDelegate:NSObjectProtocol {
    func backBtnClicked()
}

func backBtn(img:UIImage) -> UIButton {
    let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    
    btn.backgroundColor = UIColor.clear
    btn.backgroundImage(for: UIControlState.normal)
    
    return btn
}

func bottomView(height:CGFloat) -> UIView{
    let bottomView = UIView(frame: CGRect(x: CGFloat(0), y: height - 1, width: WIDTH, height: CGFloat(1)))
    bottomView.backgroundColor = COLOR_GREY_V2()
    return bottomView
}

class BaseFunc: NSObject {
    weak var delegate:backBtnClickedDelegate?
}
