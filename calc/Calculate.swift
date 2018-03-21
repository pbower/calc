//
//  Calculate.swift
//  calc
//
//  Created by Peter Bower on 19/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//
//  Description:
//  Performs a calculation pass on the input string
//  I.e., for input with several numbers and operators, the Calculate.calculate() method is called repeatedly

import Foundation

class Calculate {
    
    var firstNum: Int   //First number to be used in calculation pass
    var op: String      //Operator to be used in calculation pass
    var secondNum: Int  //Second number to be used in calculation pass
    var calcStart = 0   //calcStart is used to determine which integer pair is calculated in the pass
    
    //Initialise calculation by starting at the left of the input string
    init(input: [String]) {
        firstNum = Int(input[calcStart])!
        op = input[calcStart+1]
        secondNum = Int(input[calcStart+2])!
        
        if !opPrioritise() {                //if the operator is not a 'priority' operator ("x", "/", "%"),
            findCalcPair(input: input)      //increment to the next Number, Operator, Number pair
        }
    }
    
    func findCalcPair(input: [String]) {                        //Finds the first high priority Number, Operator, Number pair
        while calcStart < args.count-3 && !opPrioritise() {     //if none exists, the last one is used for the pass
            calcStart+=2
            firstNum = Int(input[calcStart])!
            op = input[calcStart+1]
            secondNum = Int(input[calcStart+2])!
        }
    }
    
    /* calculate() performs input/output calculations based on input operator(s)
     Returns:   1. the value of the calculation output
                2. the position of the result in the input array (which replaces the firstNum, op and secondNum pair) */
    
    func calculate() -> (value: Int?, position: Int) {
        var result: Int
        switch op {
        case "+":
            result = firstNum + secondNum
        case "-":
            result = firstNum - secondNum
        case "x":
            result = firstNum * secondNum
        case "/":
            result = firstNum / secondNum
        case "%":
            result = firstNum % secondNum
        default:
            return (nil, calcStart)
        }
        return (result, calcStart)
    }
    
    //Function to determine whether the operator has order of precedence
    func opPrioritise() -> Bool {
        switch op {
        case "+", "-":
            return false
        case "x", "/", "%":
            return true
        default:
            return false
        }
    }
    
    
}
