//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18. Modified by Peter Bower 21/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation
var args = ProcessInfo.processInfo.arguments
args.removeFirst()                                  // remove the name of the program from args
Validation(args: args).checkInputIsValid()          //validate args input

var result: (value: Int?, position: Int) = (0, 0)   //initialise empty calculation result

if args.count == 1 {                                //handle single argument
    print(Int(args[0])!)
}

if args.count > 2 {                                 //perform calculation passes until the result is reached
    while args.count > 2 {
        (result.value, result.position) = Calculate(args: args).calculate()
        args = UpdateArgs(args: args, resultValue: result.value, resultPosition: result.position).update()
    }
    print(result.value!)
}






