//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 上村 宙生 on 2016/06/16.
//  Copyright © 2016年 huemura. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var number:Int = 99
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let viewController: ViewController = self.storyboard?.instantiateViewControllerWithIdentifier("VC") as! ViewController
        imageView.image = UIImage(named: viewController.imageAry[number])
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
