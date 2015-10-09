//
//  ViewController.swift
//  CalcApp
//
//  Created by Gayle Ocampo on 9/30/15.
//  Copyright © 2015 Gayle Ocampo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblResultField: UITextField!
    @IBOutlet weak var btnDecimal: UIButton!
   
    //Create variables to keep track of answer and operator
    var num1 = Float()
    var num2 = Float()
    var results = Double()
    var operatorTapped = ""
    var isTyping = false
    var integerTapped = false
    var tempNumber = Float()
    var tempNegative = Int()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //When a number button is clicked, update the number
    @IBAction func btnNumberTapped(sender: UIButton) {
        
        var numTapped = sender.currentTitle
        
        //Case where +/- button is pressed first
        if lblResultField.text == "-0.0" {
            print("clicked negative first")
            tempNegative = -Int(numTapped!)!
            numTapped = String(tempNegative)
        }
        
        if isTyping {
            lblResultField.text = lblResultField.text! + numTapped!
        } else {
            lblResultField.text = numTapped
        }
        
        isTyping = true
    }
    
    //When the deicmal is tapped
    @IBAction func btnDecimalTapped(sender: UIButton) {
        lblResultField.text = lblResultField.text! + "."
        btnDecimal.enabled = false
    }
    
    //If the +/- button is tapped, make the variable true
    @IBAction func btnIntegerTapped(sender: UIButton) {
        integerTapped = true
        tempNumber = Float(lblResultField.text!)!
        tempNumber = -tempNumber
        lblResultField.text = String(tempNumber)
    }
    
    //When an operator is tapped, collect the first number and store operator
    @IBAction func btnOperatorTapped(sender: UIButton) {
        operatorTapped = sender.currentTitle!
        num1 = (lblResultField.text! as NSString).floatValue
        lblResultField.text = ""
        integerTapped = false
        btnDecimal.enabled = true
        isTyping = false
    }
    
    //When the = sign is tapped, determine operation
    @IBAction func btnEqualsTapped(sender: UIButton) {
        
        num2 = (lblResultField.text! as NSString).floatValue
        
        //Instantiate OperationCalc class
        let calculatedAnswer = OperationCalc(firstNumber: Double(num1), secondNumber: Double(num2))
        
        //Perform calculation based on operation tapped
        switch operatorTapped {
            case "+":
                results = calculatedAnswer.addition()
            case "-":
                results = calculatedAnswer.subtraction()
            case "x":
                results = calculatedAnswer.multiplication()
            case "/":
                results = calculatedAnswer.division()
            case "% (Mod)":
                results = calculatedAnswer.mod()
            case "e^x":
                results = calculatedAnswer.exponent()
        default:
            lblResultField.text = "invalid operator"
        }
        
        isTyping = false
        
        //Displays answer to 3 decimal places
        lblResultField.text = String.localizedStringWithFormat("%.3f", results)
    }
    
    @IBAction func btnClearTapped(sender: UIButton) {
        //Clears the variables
        num1 = 0
        num2 = 0
        results = 0
        operatorTapped = ""
        lblResultField.text = "0"
        isTyping = false
        integerTapped = false
        btnDecimal.enabled = true
    }
}

