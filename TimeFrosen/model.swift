//
//  model.swift
//  TimeFrosen
//
//  Created by 陈鲁同 on 2017/10/10.
//  Copyright © 2017年 Ertuil. All rights reserved.
//

import UIKit



class model{
    static let mo = model.init()
    var lock :Bool! = false
    var InStudyFlag = false
    var choTime:Int = 0
    var startTime :NSDate!
    var stopTime :NSDate!
    var success : Int = 0
    var total : Int = 0
    var brit = UIScreen.main.brightness
    var result : [Dictionary<String,String>] = []
    var firstInit = true
    var wapp : Dictionary<String,Bool> = [:]
    private init(){
        lock = false
        firstInit = true
        wapp["Phone"] = true
        wapp["Message"] = true
        wapp["QQ"] = false
        wapp["Wechat"] = false
        wapp["Alipay"] = false
        wapp["Netmusic"] = false
        wapp["Bilibili"] = false
        wapp["Camera"] = false
        wapp["Photos"] = false
        wapp["Shanbei"] = false
        wapp["Zhihu"] = false
        wapp["Baiduyun"] = false
        wapp["UC"] = false
        wapp["Wangzhe"] = false
        print(wapp)
    }
}

