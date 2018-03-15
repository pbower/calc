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

print(Int(args[0])!)

/*
 class InputProcessing {
    func processInput() {
    }
}
 */


func calculate(_ firstNum: Int,_ secondNum: Int,_ modifier: Character) -> Int? {
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

let myCalc = calculate(36, 24, "x")
print(myCalc ?? "Error")
