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
    
    let firstNum: Int
    let op: String
    let secondNum: Int
    
    init(input: [String]) {
        firstNum = Int(input[0])!
        op = input[1]
        secondNum = Int(input[2])!
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
}
