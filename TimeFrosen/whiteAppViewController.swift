//
//  whiteAppViewController.swift
//  TimeFrosen
//
//  Created by 陈鲁同 on 2017/10/13.
//  Copyright © 2017年 Ertuil. All rights reserved.
//

import UIKit
class whiteAppViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var mo = model.mo
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
     
    }
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mo.wapp.count
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath)->UITableViewCell {
        let cell :wappCell = tableView.dequeueReusableCell(withIdentifier: "wappCell", for: indexPath) as! wappCell
        switch indexPath.row {
        case 0:
            cell.label.text="电话"
            cell.Button.isOn = mo.wapp["Phone"]!
            cell.Button.addTarget(self, action:#selector(tappedb1(sender:)), for:.valueChanged)
        case 1:
            cell.label.text="短信"
            cell.Button.isEnabled = mo.wapp["Message"]!
            cell.Button.addTarget(self, action:#selector(tappedb2(sender:)), for:.valueChanged)
        case 2:
            cell.label.text="QQ"
            cell.Button.isOn = mo.wapp["QQ"]!
            cell.Button.addTarget(self, action:#selector(tappedb3(sender:)), for:.valueChanged)
        case 3:
            cell.label.text="微信"
            cell.Button.isOn = mo.wapp["Wechat"]!
            cell.Button.addTarget(self, action:#selector(tappedb4(sender:)), for:.valueChanged)
        case 4:
            cell.label.text="支付宝"
            cell.Button.isOn = mo.wapp["Alipay"]!
            cell.Button.addTarget(self, action:#selector(tappedb5(sender:)), for:.valueChanged)
        case 5:
            cell.label.text="网易云音乐"
            cell.Button.isOn = mo.wapp["Netmusic"]!
            cell.Button.addTarget(self, action:#selector(tappedb6(sender:)), for:.valueChanged)
        case 6:
            cell.label.text="Bilibili"
            cell.Button.isOn = mo.wapp["Bilibili"]!
            cell.Button.addTarget(self, action:#selector(tappedb7(sender:)), for:.valueChanged)
        case 7:
            cell.label.text="相机"
            cell.Button.isOn = mo.wapp["Camera"]!
            cell.Button.addTarget(self, action:#selector(tappedb8(sender:)), for:.valueChanged)
        case 8:
            cell.label.text="相册"
            cell.Button.isOn = mo.wapp["Photos"]!
            cell.Button.addTarget(self, action:#selector(tappedb9(sender:)), for:.valueChanged)
        case 9:
            cell.label.text="扇贝"
            cell.Button.isOn = mo.wapp["Shanbei"]!
            cell.Button.addTarget(self, action:#selector(tappedb10(sender:)), for:.valueChanged)
        case 10:
            cell.label.text="知乎"
            cell.Button.isOn = mo.wapp["Zhihu"]!
            cell.Button.addTarget(self, action:#selector(tappedb11(sender:)), for:.valueChanged)
        case 11:
            cell.label.text="百度云"
            cell.Button.isOn = mo.wapp["Baiduyun"]!
            cell.Button.addTarget(self, action:#selector(tappedb12(sender:)), for:.touchUpInside)
        case 12:
            cell.label.text="UC"
            cell.Button.isOn = mo.wapp["UC"]!
            cell.Button.addTarget(self, action:#selector(tappedb13(sender:)), for:.touchUpInside)
        
        case 13:
            cell.label.text="王者荣耀"
            cell.Button.isOn = mo.wapp["Wangzhe"]!
            cell.Button.addTarget(self, action:#selector(tappedb14(sender:)), for:.touchUpInside)
        default:
            print("No raw")
        }
        return cell
    }
    
    @objc func tappedb1(sender : UISwitch){
        mo.wapp["Phone"] = sender.isOn
    }
    @objc func tappedb2(sender : UISwitch){
       mo.wapp["Message"] = sender.isOn
    }
    @objc func tappedb3(sender : UISwitch){
       mo.wapp["QQ"] = sender.isOn
    }
    @objc func tappedb4(sender : UISwitch){
        mo.wapp["Wechat"] = sender.isOn
    }
    @objc func tappedb5(sender : UISwitch){
       mo.wapp["Alipay"] = sender.isOn
    }
    @objc func tappedb6(sender : UISwitch){
        mo.wapp["Netmusic"] = sender.isOn
    }
    @objc func tappedb7(sender : UISwitch){
        mo.wapp["Bilibili"] = sender.isOn
    }
    
    @objc func tappedb8(sender : UISwitch){
        mo.wapp["Camera"] = sender.isOn
    }
    @objc func tappedb9(sender : UISwitch){
       mo.wapp["Photos"] = sender.isOn
    }
    
    @objc func tappedb10(sender : UISwitch){
       mo.wapp["Shanbei"] = sender.isOn
    }
    
    @objc func tappedb11(sender : UISwitch){
        mo.wapp["Zhihu"] = sender.isOn
    }
    
    @objc func tappedb12(sender : UISwitch){
        mo.wapp["Baiduyun"] = sender.isOn
    }
    
    @objc func tappedb13(sender : UISwitch){
       mo.wapp["UC"] = sender.isOn
    }
    @objc func tappedb14(sender : UISwitch){
        mo.wapp["Wangzhe"] = sender.isOn
    }
}
    
class wappCell:UITableViewCell{
    @IBOutlet weak var Button: UISwitch!
    
    @IBOutlet weak var label: UILabel!
}

