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
    var points = 0
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self

        for record in mo.result{
            if record["res"] == "true"{
                points += Int(record["min"]!)! * 10
            }else{
                points = 0
            }
        }
        Label.text = "成功：\(mo.success)次\t\t失败：\(mo.total-mo.success)次\t\t得分：\(points)"
        
        
    }
    @IBAction func ClearAll(_ sender: UIButton) {
        if points < 5000{
            let alertController = UIAlertController(title: "想啥呢？",
                                                    message: "分数不够5000，不能清除", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "好的，我知道了", style: .default, handler:nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }else{
            let alertController = UIAlertController(title: "正式警告",
                                                    message: "确定要你的辛苦努力么？", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "手贱，点错了", style: .cancel, handler: nil)
            let okAction = UIAlertAction(title: "好的，我想清楚了", style: .default, handler: {
                action in
                self.mo.total = 0
                self.mo.success = 0
                self.mo.result = []
                self.tableView.reloadData()
                self.points = 0
                self.Label.text = "成功：\(self.mo.success)次\t\t失败：\(self.mo.total-self.mo.success)次\t\t得分：\(self.points)"
            })
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
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

        cell.textLabel!.text = "时间:\(String(describing: mo.result[mo.result.count-indexPath.row-1]["Time"]!)).\t\t学习了\(mo.result[mo.result.count-indexPath.row-1]["min"] ?? "NULL")分钟"
        if mo.result[mo.result.count-indexPath.row-1]["res"] == "true" {
            cell.textLabel?.textColor = UIColor.green
        }else{
            cell.textLabel?.textColor = UIColor.red
        }
        return cell
    }
}

