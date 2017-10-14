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
        mo.lock = true
        // Do any additional setup after loading the view, typically from a nib.
        if mo.firstInit == true{
            let str = "com.apple.springboard.lockstate"
            //let cfstr : CFString = str.withCString(getenv) as! CFString
            print(str)

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
        mo.choTime = Int(sender.value)
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
        mo.lock = true
    }
}

