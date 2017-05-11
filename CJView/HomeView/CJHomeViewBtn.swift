//
//  CJHomeViewBtn.swift
//  TestSwiftUI
//
//  Created by user on 2017/4/20.
//  Copyright © 2017年 Annie Hou. All rights reserved.
//

import UIKit
protocol CJHomeViewBtnDelegate:NSObjectProtocol {
    func homeBtnClicked(tag:NSInteger)
}
class CJHomeViewBtn: UIView {
    
    weak var delegate:CJHomeViewBtnDelegate?
    
    var btn = UIButton(frame: CGRect(x: 0, y: 0, width: WIDTH - 80, height: 100))
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        btn.backgroundColor = COLOR_RED_V2()
        btn.setTitle("弹出分享面板", for: .normal)
        btn.addTarget(self, action: #selector(firstBtnClicked(btn:)), for: .touchUpInside)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 10.0
        self.addSubview(btn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func firstBtnClicked(btn:UIButton) -> Void {
        self.delegate?.homeBtnClicked(tag: btn.tag)
    }

}
