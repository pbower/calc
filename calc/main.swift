//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//
//  Created by Peter Bower on 21/3/18
//  Copyright © 2018 UTS. All rights reserved.
//


import Foundation
var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program
//print(Int(args[0])!)
//print(args)
var result: (value: Int?, position: Int)
result = (0, 0)
try CheckInput(input: args).checkInputIsValid()
try CheckInput(input: args).isOutOfBounds()

if args.count > 2 {
    while args.count > 2 {
        (result.value, result.position) = try Calculate(input: args).calculate()
        args = UpdateInput(input: args, resultValue: result.value, resultPosition: result.position).update()
        //print("Args After update: ", args)
        //print("Position before update: \(result.position)")
    }
} else {
    print("Error")     /* Placeholder */
}
print(result.value!)





