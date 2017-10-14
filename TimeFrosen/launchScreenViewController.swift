//
//  launchScreenViewController.swift
//  TimeFrosen
//
//  Created by 陈鲁同 on 2017/10/13.
//  Copyright © 2017年 Ertuil. All rights reserved.
//
import UIKit
class launchScreenViewController: UIViewController {
    
    @IBOutlet weak var Button: UIButton!
    var timer :Timer!
    var mo = model.mo
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 3 ,target:self,selector: #selector(self.enterMain),userInfo:nil,repeats:false)
        
    }
    @objc func enterMain(){
        let story = UIStoryboard(name: "Main", bundle: nil)
        let mainViewControl = story.instantiateViewController(withIdentifier: "main") as! ViewController
        self.present(mainViewControl, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


