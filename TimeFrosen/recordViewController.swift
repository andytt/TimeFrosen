//
//  recordViewController.swift
//  TimeFrosen
//
//  Created by 陈鲁同 on 2017/10/11.
//  Copyright © 2017年 Ertuil. All rights reserved.
//


import UIKit

class recordViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    var mo = model.mo

    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        Label.text = "总共：\(mo.total)次\t\t成功：\(mo.success)次\t\t失败：\(mo.total-mo.success)次\t"
        
        
    }
    @IBAction func ClearAll(_ sender: UIButton) {
        mo.total = 0
        mo.success = 0
        mo.result = []
        tableView.reloadData()
        Label.text = "总共：\(mo.total)次\t\t成功：\(mo.success)次\t\t失败：\(mo.total-mo.success)次\t"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mo.result.count
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath)->UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reuseIdentifier")
        cell.textLabel!.text = "持续了\(mo.result[indexPath.row]["min"] ?? "NULL")分钟"
        if mo.result[indexPath.row]["res"] == "true" {
            cell.textLabel?.textColor = UIColor.green
        }else{
            cell.textLabel?.textColor = UIColor.red
        }
        return cell
    }
}

