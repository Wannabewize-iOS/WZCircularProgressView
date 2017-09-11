//
//  ViewController.swift
//  WZCircularProgressView
//
//  Created by Lee Jaehoon on 09/12/2017.
//  Copyright (c) 2017 Lee Jaehoon. All rights reserved.
//

import UIKit
import WZCircularProgressView

class ViewController: UIViewController {
    var circularView : WZCircularProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        circularView = WZCircularProgressView(frame: CGRect(x: 10, y: 280, width: 200, height: 200))
        circularView.barWidth = 20
        circularView.bgColor = UIColor.white
        circularView.progressColor = UIColor.red
        
        circularView.minimum = 10
        circularView.maximum = 20
        circularView.value = 14
        
        circularView.text = "Hello"
        circularView.textColor = UIColor.white
        circularView.textFont = UIFont.systemFont(ofSize: 20)
        
        self.view.addSubview(circularView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
            self.circularView.value = 18
            self.circularView.text = "Circular\nProgress"
            print("Value Change Test")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

