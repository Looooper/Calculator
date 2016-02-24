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
    
    var displayValue:Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
        }
    }
    
    var calculatorBrain = CalculatorBrain()
    
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
        //        opStack.append(displayValue)
        //        print(opStack)
        if let result = calculatorBrain.pushOperand(displayValue){
            displayValue = result
        } else {
            displayValue = 0
        }
    }
    
    //    var opStack = Array<Double>()
    
    @IBAction func operate(sender: UIButton) {
        let symbol = sender.currentTitle!
        if userIsInTypingANumber{
            enter()
        }
        if let result = calculatorBrain.performOperation(symbol){
            displayValue = result;
        } else {
            displayValue = 0
        }
        //        switch symbol{
        //        case "+":performOperation {$1 + $0}
        //        case "−":performOperation {$1 - $0}
        //        case "×":performOperation {$0 * $1}
        //        case "÷":performOperation {$1 / $0}
        //        case "√":performOperation {sqrt($0)}
        //        default:break
        //        }
    }
    
    //    func performOperation (operation:(Double,Double)->Double){
    //        if opStack.count >= 2{
    //            displayValue = operation(opStack.removeLast(),opStack.removeLast())
    //            enter()
    //        }
    //    }
    
    //    func performOperation (operation:Double->Double){
    //        if opStack.count >= 1{
    //            displayValue = operation(opStack.removeLast())
    //            enter()
    //        }
    //    }
}

