//
//  cameraViewController.swift
//  TimeFrosen
//
//  Created by 陈鲁同 on 2017/10/14.
//  Copyright © 2017年 Ertuil. All rights reserved.
//

import UIKit
class cameraViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var imagePicker: UIImagePickerController!
    var mo = model.mo
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.isEditing = true
        
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func shootAction(_ sender: UIButton) {
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController,
                                    didFinishPickingMediaWithInfo info: [String : Any]){
        //从info中取出获取的原始图片
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        UIImageWriteToSavedPhotosAlbum(image,nil, nil, nil);
        self.imageView.image = image
        //设置图片显示模式
        self.imageView.contentMode = .scaleAspectFill
        self.imagePicker.delegate = nil
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
