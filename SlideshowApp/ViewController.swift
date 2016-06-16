//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 上村 宙生 on 2016/06/16.
//  Copyright © 2016年 huemura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var number:Int = 0
    var autoFlag:Bool = false
    var timer:NSTimer?
    let imageAry:[String] = ["1.jpg","2.jpg","3.jpg"]
    let myImage1 = UIImage(named: "1.jpg")
    let myImage2 = UIImage(named: "2.jpg")
    let myImage3 = UIImage(named: "3.jpg")
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func back(sender: AnyObject) {
        number = number - 1
        setImageView()
    }
    @IBAction func next(sender: AnyObject) {
        number = number + 1
        setImageView()
        
    }
    
    @IBAction func auto(sender: AnyObject) {
        if timer == nil || !timer!.valid {
            timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        }
        else {
            timer!.invalidate()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImageView()
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.userInteractionEnabled = true
        let myTap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapGesture(_:)))
        imageView.addGestureRecognizer(myTap)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func update() {
        number = number + 1
        setImageView();
    }
    
    func tapGesture(sender:UITapGestureRecognizer){
        // 遷移するViewを定義する.このas!はswift1.2では as?だったかと。
        let resultViewController: ResultViewController = self.storyboard?.instantiateViewControllerWithIdentifier("resultVC") as! ResultViewController
        // アニメーションを設定する.
        resultViewController.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        // 値渡ししたい時 hoge -> piyo
        resultViewController.number = number
        // Viewの移動する.
        self.presentViewController(resultViewController, animated: true, completion: nil)
        print("tapped 1")
    }
    
    func setImageView() {
        if number < 0 {
            number = number + 3
            setImageView()
        }
        else if number > 2 {
            number = number - 3
            setImageView()
        }
        else {
            imageView.image = UIImage(named: imageAry[number])
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        
    }

}

