//
//  FirstViewController.swift
//  XCUITestSample
//
//  Created by ichiko on 2015/11/15.
//  Copyright © 2015年 ichiko_revjune. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var calculateLabel: UILabel!
    @IBOutlet weak var calculateLabel2: UILabel!
    @IBOutlet weak var progressLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickCalculateButton(_ sender: AnyObject) {
        let result = doubleNumber(textInput.text)
        calculateLabel.text = result
        calculateLabel2.text = result
    }

    fileprivate func doubleNumber(_ numberText: String?) -> String {
        guard numberText != nil, let result = Int(numberText!) else {
            return "計算できません"
        }
        return "\(result * 2)"
    }

    @IBAction func changeProgressSlider(_ sender: UISlider) {
        let display = NSString(format: "%.1f", sender.value) as String
        progressLabel.text = display
    }
}

