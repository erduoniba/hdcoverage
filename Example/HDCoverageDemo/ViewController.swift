//
//  ViewController.swift
//  HDCoverageDemo
//
//  Created by denglibing on 2021/10/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
        let imageView = UIImageView(frame: self.view.bounds)
        imageView.image = UIImage(named: "2")
        imageView.image = UIImage(named: "1")
        imageView.image = UIImage(named: "off_demo")
        view.addSubview(imageView)
    }

    
    @IBAction func projectOCAction(_ sender: UIButton) {
        HDOC.projectOCAction(sender.tag)
    }
    
    @IBAction func projectSwiftAction(_ sender: UIButton) {
        HDSwift.projectSwiftAction(sender.tag)
    }
    
    @IBAction func frameworkOCAction(_ sender: UIButton) {
        HDOCFramework.frameworkOCAction(sender.tag)
    }
 
    @IBAction func frameworkSwiftAction(_ sender: UIButton) {
        HDSwiftFramework.frameworkSwiftAction(sender.tag)
    }
    
    @IBAction func podsOCAction(_ sender: UIButton) {
        
    }
    
    @IBAction func podSwiftAction(_ sender: UIButton) {
        
    }
}
