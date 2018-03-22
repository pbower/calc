///////////////////////////////////////////////////////////////////////////////////////////////////////////
//  Calculate.swift
//  calc
//
//  Created by Peter Bower on 19/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//
//  Description:
//      Performs a calculation pass on the input string.
//      For input with several number operator sets the Calculate.calculate() method is called repeatedly
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////

import Foundation

class Calculate {
    
    var firstNumber: Int                                                    //First number to be used in calculation pass
    var op: String                                                          //Operator to be used in calculation pass
    var secondNumber: Int                                                   //Second number to be used in calculation pass
    var calcStartPosition = 0                                               //calcStartPosition is used to determine which integer pair is calculated in the pass
    
    init(input: [String]) {
            firstNumber = Int(input[calcStartPosition])!
            op = input[calcStartPosition+1]
            secondNumber = Int(input[calcStartPosition+2])!
            
            if !priorityOperator() {                                            //if the op is not a priority operator ('x', '/' or '%')
                findCalculationPair(input: input)                               //find the right operator and number pair
            }
    }
    
    func findCalculationPair(input: [String]) {                             //Find the first pair of numbers with a priority operator
        while calcStartPosition < args.count-3 && !priorityOperator() {
            calcStartPosition+=2
            firstNumber = Int(input[calcStartPosition])!
            op = input[calcStartPosition+1]
            secondNumber = Int(input[calcStartPosition+2])!
        }
        if calcStartPosition == input.count-3 && !priorityOperator() {     //if none is found, use the first integer pair and operator in the array
            calcStartPosition = 0
            firstNumber = Int(input[0])!
            op = input[1]
            secondNumber = Int(input[2])!
        }
    }
    
    func calculate() throws -> (value: Int?, position: Int) {                      //performs the input/output calculation for a single pair of numbers from the input array
        var result: Int                                                     //returns the calculation output and the position of the result in the array
        switch op {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "x":
            result = firstNumber * secondNumber
        case "/":
            result = firstNumber / secondNumber
        case "%":
            result = firstNumber % secondNumber
        default:
            return (nil, 0)
        }
        try CheckInput(input: ["\(result)"]).isOutOfBounds()
        return (result, calcStartPosition)
    }
    
    func priorityOperator() -> Bool {                                       //Function to determine whether the operator has order of precedence
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
