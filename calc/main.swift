//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18. Modified by Peter Bower 21/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation
var args = ProcessInfo.processInfo.arguments        //setup input arguments for processing
args.removeFirst()
Validation(args: args).checkInputIsValid()          //validate args

var result: (value: Int?, position: Int) = (0, 0)   //initialise empty calculation result

if args.count == 1 {                                //handle single argument (where optional unwrap has already been checked with 'if let' during validation)
    print(Int(args[0])!)
}

if args.count > 2 {                                 //for valid multiple arguments perform calculation passes until the final result is reached and printed
    while args.count > 2 {
        (result.value, result.position) = Calculate(args: args).calculate()
        args = UpdateArgs(args: args, resultValue: result.value, resultPosition: result.position).update()
    }
    print(result.value!)
}






