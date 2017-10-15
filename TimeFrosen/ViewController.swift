//
//  ViewController.swift
//  TimeFrosen
//
//  Created by 陈鲁同 on 2017/10/10.
//  Copyright © 2017年 Ertuil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var mo = model.mo
    override func viewDidLoad() {
        super.viewDidLoad()
        mo.choTime = 45
        showTImeText.text = "选择的时间是：\(mo.choTime)min"
        // Do any additional setup after loading the view, typically from a nib.
        if mo.firstInit == true{
            let str = "com.apple.springboard.lockcomplete"
            CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), nil,LockScream, str as CFString, nil, CFNotificationSuspensionBehavior.deliverImmediately);
            mo.firstInit = false
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var showTImeText: UILabel!
    
    @IBOutlet weak var chooseTimeSlider: UISlider!
    
    @IBOutlet weak var StartButtom: UIButton!
    
    @IBAction func changeTime(_ sender: UISlider) {
        mo.choTime = (Int(sender.value)/5*5)
        showTImeText.text = "选择的时间是：\(mo.choTime)min"
    }

    @IBAction func InStudy_2(_ sender: UIButton) {
        mo.InStudyFlag = true
    }
    
    func showFailed(){
        let FailedView = failedViewController()
        self.present(FailedView, animated: true, completion: nil)
    }
    
    typealias CFNotificationCallback =  @convention(c) (CFNotificationCenter?, UnsafeMutableRawPointer?, CFNotificationName?, UnsafeRawPointer?, CFDictionary?) ->()
    let LockScream :CFNotificationCallback = {
        (a:CFNotificationCenter?,b: UnsafeMutableRawPointer?, c:CFNotificationName?, d:UnsafeRawPointer?, e: CFDictionary?)  in ViewController.callback()
        }
    
    static func callback(){
        print("Lock")
        let mo = model.mo
        if mo.lock == false && mo.result[mo.result.count-1]["res"] == "false"{
        mo.total -= 1
        mo.result.remove(at: mo.result.count-1)
        }
        mo.InStudyFlag = true
        mo.lock = true
        
        let AppPath = NSHomeDirectory()
        let fileManager = FileManager.default
        
        let DataPath = AppPath + "/Documents/data.plist"
        if fileManager.fileExists(atPath: DataPath) == false {
            
            try!   fileManager.removeItem(atPath: DataPath)
            fileManager.createFile(atPath: DataPath, contents: nil, attributes: nil)
        }
        let data = mo.result as NSArray
        
        data.write(toFile: DataPath,atomically: true)
        
        let settingPath = AppPath + "/Documents/setting.plist"
        if fileManager.fileExists(atPath: settingPath) == false {
            
            try!   fileManager.removeItem(atPath: settingPath)
            fileManager.createFile(atPath: settingPath, contents: nil, attributes: nil)
        }
        let setting = mo.wapp as NSDictionary
        
        setting.write(toFile: settingPath,atomically: true)
    }
    
}

