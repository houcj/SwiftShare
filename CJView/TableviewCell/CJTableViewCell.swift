//
//  CJTableViewCell.swift
//  TestSwiftUI
//
//  Created by user on 2017/4/27.
//  Copyright © 2017年 Annie Hou. All rights reserved.
//

import UIKit

class CJTableViewCell: UITableViewCell {
    
    lazy var titleLab:UILabel = {
       let titleLab = UILabel.init(frame: CGRect(x: self.btn.frame.maxX + 10, y: 20, width: WIDTH - (self.btn.frame.maxX + 10), height: 40))
        titleLab.text = "123"
        return titleLab
    }()
    
    lazy var btn:UIButton = {
        let btn = UIButton.init(frame: CGRect(x: 20, y: 30, width: 20, height: 20))
        btn.layer.cornerRadius = 10
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(btnclicked(btn:)), for: UIControlEvents.touchUpInside)
    
        return btn
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        if !self.isEqual(nil) {
            let view = bottomView(height: CGFloat(80))
            
            self.addSubview(self.titleLab)
            self.addSubview(self.btn);
            self.addSubview(view)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    // MARK: - btnClicked
    func btnclicked(btn:UIButton) -> Void {
        if btn.isSelected {
            btn.backgroundColor = UIColor.red
            btn.isSelected = false
        }else{
            btn.backgroundColor = UIColor.green
            btn.isSelected = true
        }
        self.btn = btn
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
