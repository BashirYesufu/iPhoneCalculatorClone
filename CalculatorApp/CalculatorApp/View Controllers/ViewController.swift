//
//  ViewController.swift
//  CalculatorApp
//
//  Created by mac on 7/18/21.
//

import UIKit

enum Operations: String {
    case Addition = "+"
    case Subtraction = "-"
    case Division =  "/"
    case Multiplication = "*"
    case Percentage = "%"
    case Negation = "-N"
    case Empty = "Null"
}
// this declares the scope of operations to be performed.

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var numberDisplayedInLabel = ""
    var leftOperand = "" //This is the first number entered
    var rightOperand = "" //This is the second number entered
    var result = ""
    var currentOperation:Operations = .Empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLabel.text = "0"
    }
    
    @IBAction func numberTapped(_ sender: RoundedButton) {
        if numberDisplayedInLabel.count <= 8 {
            numberDisplayedInLabel += "\(sender.tag)"
            outputLabel.text = numberDisplayedInLabel
        }
    } //function to display a digit in the label
    
    @IBAction func clearAllButtonTapped(_ sender: RoundedButton) {
        numberDisplayedInLabel = ""
        leftOperand = ""
        rightOperand = ""
        result = ""
        currentOperation = .Empty
        outputLabel.text = "0"
    } //function to clear all operations and digits in the label
    
    @IBAction func decimalButtonTapped(_ sender: RoundedButton) {
        if numberDisplayedInLabel.count <= 7 && !numberDisplayedInLabel.contains("."){
            numberDisplayedInLabel += "."
            outputLabel.text = numberDisplayedInLabel
        }
    } //function to display a decimal in the label
    
    @IBAction func equalToButtonTapped(_ sender: RoundedButton) {
        implementOperation(operation: currentOperation)
    }
    @IBAction func additionButtonTapped(_ sender: RoundedButton) {
        implementOperation(operation: .Addition)
    }
    @IBAction func subtractionButtonTapped(_ sender: RoundedButton) {
        implementOperation(operation: .Subtraction)
    }
    @IBAction func multiplicationButtonTapped(_ sender: RoundedButton) {
        implementOperation(operation: .Multiplication)
    }
    @IBAction func divisionButtonTapped(_ sender: RoundedButton) {
        implementOperation(operation: .Division)
    }
    @IBAction func percentageButtonTapped(_ sender: RoundedButton) {
        implementOperation(operation: .Percentage)
    }
    @IBAction func negationButtonTapped(_ sender: RoundedButton) {
        implementOperation(operation: .Negation)
        implementOperation(operation: currentOperation)
    }
    
    func implementOperation(operation: Operations) {
        if currentOperation != .Empty {
            if numberDisplayedInLabel != "" {
                rightOperand = numberDisplayedInLabel
                numberDisplayedInLabel = ""
                
                //this function implements any operation tapped in the button
                
                
                switch currentOperation {
                case .Addition:
                    result = "\((Double(leftOperand)! + Double(rightOperand)!))"
                case .Division:
                    result = "\((Double(leftOperand)! / Double(rightOperand)!))"
                case .Multiplication:
                    result = "\((Double(leftOperand)! * Double(rightOperand)!))"
                case .Subtraction:
                    result = "\((Double(leftOperand)! - Double(rightOperand)!))"
                case .Percentage:
                    rightOperand = "100"
                    result = "\((Double(leftOperand)! / Double(rightOperand)!))"
                case .Negation:
                    rightOperand = "-1"
                    result = "\((Double(leftOperand)! * Double(rightOperand)!))"
                    
                case .Empty:
                    result = "NULL"
                }
                leftOperand = result
                
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    result = "\(Int(Double(result)!))"
                    // This trims the number in the label if it has only 0 after the decimal
                }
                outputLabel.text = result
            }
            currentOperation = operation
            
        } else {
            leftOperand = numberDisplayedInLabel
            numberDisplayedInLabel = ""
            currentOperation = operation
        } // This sets the result of a previous operation into the left operand in preparation for a new operation.
    }
}

