//
//  resultViewController.swift
//  TimeFrosen
//
//  Created by 陈鲁同 on 2017/10/11.
//  Copyright © 2017年 Ertuil. All rights reserved.
//

import UIKit

class resultViewController: UIViewController {
    var mo = model.mo
    
    @IBOutlet weak var Label: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        mo.stopTime = NSDate()
        mo.success += 1
        mo.total += 1
        let sec = mo.stopTime.timeIntervalSince(mo.startTime as Date)
        let min = Int(sec / 60)
        if mo.InStudyFlag == true {
            mo.result.append(["Time":"\(mo.stopTime)", "res":"\(true)", "min": "\(min)"])
        }
        mo.InStudyFlag = false
        Label.text = "本次时间：\(min)min"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


