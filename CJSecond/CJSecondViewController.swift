//
//  CJSecondViewController.swift
//  TestSwiftUI
//
//  Created by user on 2017/4/26.
//  Copyright © 2017年 Annie Hou. All rights reserved.
//

import UIKit

class CJSecondViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, CustomNavDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.nav)
        self.view.addSubview(self.tableview)
        
    }
    
    // MARK: - 懒加载
    lazy var nav:CJCustomNav = {
        let nav = CJCustomNav(frame: CGRect(x: 0, y: 0, width: WIDTH, height: 64))
        nav.customNav(left: UIImage.init(named: ""), title: "second", right: UIImage.init(named: ""))
        nav.delegate = self
        
        return nav
    }()
    
    lazy var tableview:UITableView = {
        let tableview = UITableView(frame: CGRect(x:0, y:64, width:WIDTH, height:HEIGHT), style: UITableViewStyle.plain)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = UITableViewCellSeparatorStyle.none
        return tableview
    }()
    
    

    // MARK: - tableviewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // MARK:- tableviewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = "9:45"
        return cell
    }
    
    // MARK: - NavDelegate
    func leftBtnClicked() {
        self.navigationController?.popViewController(animated: true)
    }
    func rightBtnClicked() {
        print("right")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
