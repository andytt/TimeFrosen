//
//  AppDelegate.swift
//  TimeFrosen
//
//  Created by 陈鲁同 on 2017/10/10.
//  Copyright © 2017年 Ertuil. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mo = model.mo

    let AppPath = NSHomeDirectory()
    let fileManager = FileManager.default

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }


    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        if mo.lock == false{
            pause()
        }
        saveData()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        loadData()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        loadData()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        saveData()
    }

    func pause(){
        if mo.InStudyFlag == true{
            mo.stopTime = NSDate()
            mo.total += 1
            let sec = mo.stopTime.timeIntervalSince(mo.startTime as Date)
            let min = Int(sec / 60)
            mo.result.append(["Time":"\(mo.stopTime)", "res":"\(false)", "min": "\(min)"])
            mo.InStudyFlag = false
            print("Pause")
        }
    }
    
    func saveData(){
        let DataPath = AppPath + "/Documents/data.plist"
        if fileManager.fileExists(atPath: DataPath) == false {

             try!   fileManager.removeItem(atPath: DataPath)
            fileManager.createFile(atPath: DataPath, contents: nil, attributes: nil)
        }
        let data = mo.result as NSArray
        print("data:\(data)")
        data.write(toFile: DataPath,atomically: true)
        
        let settingPath = AppPath + "/Documents/setting.plist"
        if fileManager.fileExists(atPath: settingPath) == false {
            
            try!   fileManager.removeItem(atPath: settingPath)
            fileManager.createFile(atPath: settingPath, contents: nil, attributes: nil)
        }
        let setting = mo.wapp as NSDictionary
        print(setting)
        setting.write(toFile: settingPath,atomically: true)
    }
    
    func loadData(){
        mo.result = []
        mo.total = 0
        mo.success = 0
        let DataPath = AppPath + "/Documents/data.plist"
        
        let cacheData = NSArray(contentsOfFile: DataPath)
        if cacheData == nil {
            fileManager.createFile(atPath: DataPath, contents: nil, attributes: nil)
            return
        }
        for elem in cacheData!{
            mo.result.append(elem as! [String : String])
            mo.total += 1
            if mo.result.last!["res"] == "true" {
                mo.success += 1
            }
        }
        
        let settingPath = AppPath + "/Documents/setting.plist"
        
        let cachesetting = NSDictionary(contentsOfFile: settingPath)
        if cachesetting == nil {
            fileManager.createFile(atPath: settingPath, contents: nil, attributes: nil)
            return
        }
        
        mo.wapp = cachesetting! as! Dictionary
        print(mo.wapp)
    }
    
}

