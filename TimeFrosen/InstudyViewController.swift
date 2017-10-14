//
//  InstudyViewController.swift
//  TimeFrosen
//
//  Created by 陈鲁同 on 2017/10/10.
//  Copyright © 2017年 Ertuil. All rights reserved.
//


import UIKit

class InstudyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var mo = model.mo
    var timer:Timer!
    var timer_2:Timer!
    
    @IBOutlet var SelfView: UIView!

    @IBOutlet weak var table: UITableView!
    

    @IBOutlet weak var BackButton: UIButton!

    @IBOutlet var PanGesture: UIPanGestureRecognizer!
    
    @IBOutlet weak var showLabel: UILabel!
    
    @objc func finishStudy(){
        BackButton.isEnabled = true
        
    }
    
    @objc func changeLabel(){
        let nowTime = NSDate()
        let sec = nowTime.timeIntervalSince(mo.startTime as Date)
        var min = Int(sec / 60) - 1
        min -= mo.choTime
        if min <= 0 {
            showLabel.text="还有 \(-min)分钟"
        }else{
            showLabel.text="已经超过了\(min)分钟"
        }
        
    }
    override func viewDidLoad() {

        super.viewDidLoad()
        self.BackButton.isEnabled = false
        self.table.dataSource = self
        self.table.delegate = self
        //NotificationCenter.default.addObserver(self, selector: #selector(checkLock), name:  NSNotification.Name(rawValue: "UIApplicationWillEnterForegroundNotification"), object: nil)
        
        showLabel.text = "开始了呢"
        // Do any additional setup after loading the view, typically from a nib.
        mo.startTime = NSDate()
        //timer = Timer.scheduledTimer(timeInterval: TimeInterval(mo.choTime * 60) ,target:self,selector: #selector(self.finishStudy),userInfo:nil,repeats:false)
        
        //timer_2 = Timer.scheduledTimer(timeInterval: 60 ,target:self,selector: #selector(self.changeLabel),userInfo:nil,repeats:true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func PanAction(_ sender: UIPanGestureRecognizer) {
        let _transX = sender.translation(in: SelfView).x
        let weight = SelfView.bounds.width
        UIScreen.main.brightness += _transX / weight
        //View2.alpha += _transX/weight
    }
    @objc func checkLock(){
        print("check")
        if mo.lock == false {
            
            let story = UIStoryboard(name: "Main", bundle: nil)
            let failedViewControl = story.instantiateViewController(withIdentifier: "failed") as! failedViewController
            self.present(failedViewControl, animated: true)
        }
        mo.lock = false
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(checkLock), name:  NSNotification.Name(rawValue: "UIApplicationWillEnterForegroundNotification"), object: nil)
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(mo.choTime * 60) ,target:self,selector: #selector(self.finishStudy),userInfo:nil,repeats:false)
        
        timer_2 = Timer.scheduledTimer(timeInterval: 60 ,target:self,selector: #selector(self.changeLabel),userInfo:nil,repeats:true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        timer.invalidate()
        timer = nil
        timer_2.invalidate()
        timer = nil
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
        let cell :TableCell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! TableCell
        cell.Button.titleLabel?.text = "打开"
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text="电话"
            cell.Button.isEnabled = mo.wapp["Phone"]!
            cell.Button.addTarget(self, action:#selector(tappedb1), for:.touchUpInside)
        case 1:
            cell.textLabel?.text="短信"
            cell.Button.isEnabled = mo.wapp["Message"]!
            cell.Button.addTarget(self, action:#selector(tappedb2), for:.touchUpInside)
        case 2:
            cell.textLabel?.text="QQ"
            cell.Button.isEnabled = mo.wapp["QQ"]!
            cell.Button.addTarget(self, action:#selector(tappedb3), for:.touchUpInside)
        case 3:
            cell.textLabel?.text="微信"
            cell.Button.isEnabled = mo.wapp["Wechat"]!
            cell.Button.addTarget(self, action:#selector(tappedb4), for:.touchUpInside)
        case 4:
            cell.textLabel?.text="支付宝"
            cell.Button.isEnabled = mo.wapp["Alipay"]!
            cell.Button.addTarget(self, action:#selector(tappedb5), for:.touchUpInside)
        case 5:
            cell.textLabel?.text="网易云音乐"
            cell.Button.isEnabled = mo.wapp["Netmusic"]!
            cell.Button.addTarget(self, action:#selector(tappedb6), for:.touchUpInside)
        case 6:
            cell.textLabel?.text="Bilibili"
            cell.Button.isEnabled = mo.wapp["Bilibili"]!
            cell.Button.addTarget(self, action:#selector(tappedb7), for:.touchUpInside)
        case 7:
            cell.textLabel?.text="相机"
            cell.Button.isEnabled = mo.wapp["Camera"]!
            cell.Button.addTarget(self, action:#selector(tappedb8), for:.touchUpInside)
        case 8:
            cell.textLabel?.text="相册"
            cell.Button.isEnabled = mo.wapp["Photos"]!
            cell.Button.addTarget(self, action:#selector(tappedb9), for:.touchUpInside)
        case 9:
            cell.textLabel?.text="扇贝"
            cell.Button.isEnabled = mo.wapp["Shanbei"]!
            cell.Button.addTarget(self, action:#selector(tappedb10), for:.touchUpInside)
        case 10:
            cell.textLabel?.text="知乎"
            cell.Button.isEnabled = mo.wapp["Zhihu"]!
            cell.Button.addTarget(self, action:#selector(tappedb11), for:.touchUpInside)
        case 11:
            cell.textLabel?.text="百度云"
            cell.Button.isEnabled = mo.wapp["Baiduyun"]!
            cell.Button.addTarget(self, action:#selector(tappedb12), for:.touchUpInside)
        case 12:
            cell.textLabel?.text="UC"
            cell.Button.isEnabled = mo.wapp["UC"]!
            cell.Button.addTarget(self, action:#selector(tappedb13), for:.touchUpInside)
        case 13:
            cell.textLabel?.text="王者荣耀"
            cell.Button.isEnabled = mo.wapp["Wangzhe"]!
            cell.Button.addTarget(self, action:#selector(tappedb14), for:.touchUpInside)
            
        default:
            print("No raw")
        }
        return cell
    }
    
    @objc func tappedb1(){
        openURL("telprompt://")
        mo.lock = true
    }
    @objc func tappedb2(){
        openURL("sms://")
        mo.lock = true
    }
    @objc func tappedb3(){
        openURL("mqq://")
        mo.lock = true
    }
    @objc func tappedb4(){
        openURL("weixin://")
        mo.lock = true
    }
    @objc func tappedb5(){
        openURL("alipay://")
        mo.lock = true
    }
    @objc func tappedb6(){
        openURL("orpheus://")
        mo.lock = true
    }
    @objc func tappedb7(){
        openURL("bilibili://")
        mo.lock = true
    }
    
    @objc func tappedb8(){
        openURL("camera://")
        mo.lock = true
    }
    @objc func tappedb9(){
        openURL("photos-redirect://")
        mo.lock = true
    }
    
    @objc func tappedb10(){
        openURL("shanbay://")
        mo.lock = true
    }
    
    @objc func tappedb11(){
        openURL("zhihu://")
        mo.lock = true
    }
    
    @objc func tappedb12(){
        openURL("baiduyun://")
        mo.lock = true
    }
    
    @objc func tappedb13(){
        openURL("ucbrowser://")
        mo.lock = true
    }
    @objc func tappedb14(){
        openURL("tencentlaunch1104466820://")
        mo.lock = true
    }
    func openURL(_ URLString : String) {
        guard let url = URL(string: URLString) else {return}
        guard UIApplication.shared.canOpenURL(url) else {return}
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

class TableCell :UITableViewCell{
    
    @IBOutlet weak var Button: UIButton!
    
}
