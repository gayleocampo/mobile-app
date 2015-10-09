//
//  OperationCalc.swift
//  CalcApp
//
//  Created by Gayle Ocampo on 9/30/15.
//  Copyright © 2015 Gayle Ocampo. All rights reserved.
//

import Foundation

class OperationCalc{
    
    //Create variables for operations
    let firstNumber: Double
    let secondNumber: Double
    
    //Initialize variables
    init(firstNumber: Double, secondNumber: Double){
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
    }
    
    //Addition function
    func addition() -> Double {
        return firstNumber + secondNumber
    }
    
    //Subtraction function
    func subtraction() -> Double {
        return firstNumber - secondNumber
    }
    
    //Multiplication function
    func multiplication() -> Double {
        return firstNumber * secondNumber
    }
    
    //Division function
    func division() -> Double {
        if secondNumber == 0 {
            return 0.0
        } else {
            return firstNumber / secondNumber
        }
    }
    
    //Exponentation function
    func exponent() -> Double {
        return pow(firstNumber, secondNumber)
    }
    
    //Mod function
    func mod() -> Double {
        return firstNumber % secondNumber
    }
}
