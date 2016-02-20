//
//  ViewController.swift
//  Calculator
//
//  Created by 沈凡 on 16/2/19.
//  Copyright © 2016年 SanJiang University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTypingANumber = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTypingANumber{
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTypingANumber = true
        }
    }
    @IBAction func enter() {
        userIsInTypingANumber = false
        
    }
    
    @IBAction func performOperate(sender: UIButton) {
        if let symbol = sender.currentTitle{
            switch symbol{
            case "+":
            case "−":
            case "×":
            case "÷":
            }
        }
    }
}

