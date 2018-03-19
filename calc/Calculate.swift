//
//  Calculate.swift
//  calc
//
//  Created by Peter Bower on 19/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//
//  Description:
//  Performs a calculation pass on the input string

import Foundation

class Calculate {
    
    var firstNum: Int
    var op: String
    var secondNum: Int
    var x = 0   //x is used to determine which integer pair is calculated first
    
    init(input: [String]) {
        firstNum = Int(input[x])!
        op = input[x+1]
        secondNum = Int(input[x+2])!
        if !opPrioritise() {
            findCalcPair(input: input)
        }
    }
    
    //Function performs input/output calculations based on input operator(s)
    func calculate() -> Int? {
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
            return nil
        }
        return result
    }
    
    //Function to determine operator order of precedence
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
    
    func findCalcPair(input: [String]) {
        while x < args.count-3 && !opPrioritise() {
            x+=2
            firstNum = Int(input[x])!
            op = input[x+1]
            secondNum = Int(input[x+2])!
        }
    }
}
