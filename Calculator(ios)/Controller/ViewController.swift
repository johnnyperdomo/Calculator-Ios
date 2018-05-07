//
//  ViewController.swift
//  Calculator(ios)
//
//  Created by Johnny Perdomo on 5/5/18.
//  Copyright © 2018 Johnny Perdomo. All rights reserved.
//

import UIKit

enum Operation: String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case Null = "nil"
}


class ViewController: UIViewController {

    var runningNumber = ""
    var currentOperation:Operation = .Null
    var leftValue = ""
    var rightValue = ""
    var result = ""
    
    @IBOutlet weak var numberView: UILabel!
    @IBOutlet weak var number0: RoundButton!
    @IBOutlet weak var dotBtn: RoundButton!
    @IBOutlet weak var flipValueBtn: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numberView.text = "0"
        number0.isEnabled = false
    }

    @IBAction func clearBtnPressed(_ sender: RoundButton) {
        dotBtn.isEnabled  = true
        number0.isEnabled = false
        numberView.text = "0"
        runningNumber = ""
        currentOperation = .Null
        leftValue = ""
        rightValue = ""
        result = ""
    }
    
    @IBAction func dotBtnPressed(_ sender: RoundButton) {
        
        if runningNumber.contains(".") {
            dotBtn.isEnabled = false
        } else if runningNumber.count <= 8 {
            runningNumber += "."
            numberView.text = runningNumber
        }
    }
    
    @IBAction func numberPressed(_ sender: RoundButton) {
        
        if runningNumber.count < 1 {
            number0.isEnabled = true
        }
        
        if runningNumber.count <= 9 {
        runningNumber += "\(sender.tag)"
        numberView.text = runningNumber
        }
    }
    
    @IBAction func multiplicationBtnPressed(_ sender: RoundButton) {
        operation(operation: .Multiply)
    }
    
    @IBAction func divisionBtnPressed(_ sender: RoundButton) {
        operation(operation: .Divide)
    }
    
    @IBAction func subtractionBtnPressed(_ sender: RoundButton) {
        operation(operation: .Subtract)
    }
    
    @IBAction func additionBtnPressed(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    
    @IBAction func equalBtnPressed(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    
    
    func operation(operation: Operation) { //Math
        if currentOperation != .Null { //If chosen operation
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                } else if currentOperation == .Subtract {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                } else if currentOperation == .Multiply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                } else if currentOperation == .Divide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) { //make doubles, integers
                    result = "\(Int(Double(result)!))"
                }
                numberView.text = result
                
            }
            currentOperation = operation
            
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }

    
    
    
    
}

