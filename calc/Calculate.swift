//
//  Calculate.swift
//  calc
//
//  Created by Peter Bower on 19/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//
//  Description:    Performs a single calculation pass on the 'args' [string]


import Foundation

class Calculate {
    
    var firstNumber: Int                                                    //First number to be used in calculation pass
    var op: String                                                          //Operator to be used in calculation pass
    var secondNumber: Int                                                   //Second number to be used in calculation pass
    var calcStartPosition = 0                                               //calcStartPosition is used to determine which integer pair is calculated in the pass
    
    init(args: [String]) {
            firstNumber = Int(args[calcStartPosition])!
            op = args[calcStartPosition+1]
            secondNumber = Int(args[calcStartPosition+2])!
            
            if !priorityOperator() {                                        //if the op is not a priority operator ('x', '/' or '%')
                findCalculationPair(args: args)                             //find the right operator and number pair
            }
    }
    
    func findCalculationPair(args: [String]) {                              //Find the first pair of numbers with a priority operator
        while calcStartPosition < args.count-3 && !priorityOperator() {
            calcStartPosition+=2
            firstNumber = Int(args[calcStartPosition])!
            op = args[calcStartPosition+1]
            secondNumber = Int(args[calcStartPosition+2])!
        }
        if calcStartPosition == args.count-3 && !priorityOperator() {       //if none is found, use the first integer pair and operator in the array
            calcStartPosition = 0
            firstNumber = Int(args[0])!
            op = args[1]
            secondNumber = Int(args[2])!
        }
    }
    
    //Note: Operators are maintained in the below two functions
    
    func calculate() throws -> (value: Int?, position: Int) {               //performs the args/output calculation for a single pair of numbers from the args array
        var result: Int                                                     //returns the calculation output and the position of the result in the array
        do {
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
            try ErrorCheckCalls(args: ["\(result)"]).isOutOfBounds()
            return (result, calcStartPosition)
        } catch {
                throw CalcError.invalidInput
        }
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
