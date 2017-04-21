//
//  CJHomeViewBtn.swift
//  TestSwiftUI
//
//  Created by user on 2017/4/20.
//  Copyright © 2017年 Annie Hou. All rights reserved.
//

import UIKit
protocol CJHomeViewBtnDelegate:NSObjectProtocol {
    func homeBtnClicked()
}
class CJHomeViewBtn: UIView {
    
    weak var delegate:CJHomeViewBtnDelegate?
    
    var firstBtn = UIButton(frame: CGRect(x: 0, y: 0, width: WIDTH - 80, height: 100))
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        firstBtn.backgroundColor = UIColor.red
        firstBtn.setTitle("交电费", for: .normal)
        firstBtn.addTarget(self, action: #selector(firstBtnClicked), for: .touchUpInside)
        self.addSubview(firstBtn)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func firstBtnClicked() -> Void {
        self.delegate?.homeBtnClicked()
    }

}
