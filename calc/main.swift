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

if args.count > 3 {
    while args.count > 3 {
        let (resultValue, resultPosition) = Calculate(input: args).calculate()
        args = UpdateInput(input: args, resultValue: resultValue, resultPosition: resultPosition).update()
        print(args)
        print(resultValue!)
    }
} else {
    print("Error")     /* Placeholder */
}







