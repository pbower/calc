//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation
var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program
//print(Int(args[0])!)

func readInput (_ input: String) -> Array<String> {
    let output = input.split {$0 == " "}.map {String($0)}
    return output
}

func calculate(_ firstNum: Int,_ modifier: String, _ secondNum: Int) -> Int? {
    var result: Int
    switch modifier {
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

var array = readInput("-43 + 5 + 32")
print(array)
let firstNum = Int(array[0])!
let modifier = array[1]
let secondNum = Int(array[2])!

var calcOutput = calculate(firstNum, modifier, secondNum)!
print(calcOutput)

print(array[2...array.count-1])

print(array)



