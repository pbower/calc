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
//print(Int(args[0])!)
print(args)

while args.count > 3 {
    var result = Calculate(input: args).calculate()
    args = [String(result!)] + ReadInput (input: args).trimInput()
    result = Calculate(input: args).calculate()
    //args = [String(result!)] + ReadInput (input: args).trimInput()
print(args)
print(result!)
}







