//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//
//
//

import Foundation
var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program
print(Int(args[0])!)

//Convert input string to array to isolate input components for processing
func readInput (_ input: String) -> Array<String> {
    let output = input.split {$0 == " "}.map {String($0)}
    return output
}

//Provide facility to isolate integers as an array for validation and input exception handling
func strToInt (_ input: [String]) -> [Int] {
    let output = input.map {Int($0)}.filter{$0 != nil}.map { $0! }
    return output
}

//Function performs input/output calculations based on input operator(s)
func calculate(_ firstNum: Int,_ op: String, _ secondNum: Int) -> Int? {
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

//Temp Input for Development
var array = readInput("-43 + 5 + 32 * 32")

//Element counts for validation and input exception handling
var totalchar = array.count
var totalint = strToInt(array).count
var totalop = totalchar - totalint

//Variables for left to right input parsing
let firstNum = Int(array[0])!
let op = array[1]
let secondNum = Int(array[2])!
var calcOutput = calculate(firstNum, op, secondNum)! //Left to Right process x 1
print(calcOutput)

print(array[2...array.count-1])

print(array)



