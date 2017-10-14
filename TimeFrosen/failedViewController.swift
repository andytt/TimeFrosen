//
//  failViewController.swift
//  TimeFrosen
//
//  Created by 陈鲁同 on 2017/10/11.
//  Copyright © 2017年 Ertuil. All rights reserved.
//

import UIKit

class failedViewController: UIViewController {
    var mo = model.mo
    
    @IBOutlet weak var Label: UILabel!
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mo.stopTime = NSDate()
        mo.total += 1
        let sec :Double
        if mo.stopTime == nil {
            sec = -60
        }else{
            sec = mo.stopTime.timeIntervalSince(mo.startTime as Date)
        }
        let min = Int(sec / 60)
        if mo.InStudyFlag == true{
            let dateF = DateFormatter()
            dateF.locale = NSLocale.current
            dateF.dateFormat = "yyyy-MM-dd HH:mm"
            let datestr = dateF.string(from: mo.stopTime as Date)
            if min >= mo.choTime{
                mo.result.append(["Time":"\(datestr)", "res":"\(true)", "min": "\(min)"])
            }else{
                mo.result.append(["Time":"\(datestr)", "res":"\(false)", "min": "\(min)"])
            }
        }
        mo.InStudyFlag = false
        if min == -1 {
            Label.text = "很遗憾，没有完成!中途退出！"
        }else{
            Label.text = "很遗憾，没有完成时间！本次时间：\(min)min"
        }
        print(mo.result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.
    }
    
    
}



