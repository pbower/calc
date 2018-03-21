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
    while args.count > 2 {
        let (resultValue, resultPosition) = Calculate(input: args).calculate()
        print("Position before update: \(resultPosition)")
        print("Args Before update: ", args)
        args = UpdateInput(input: args, resultValue: resultValue, resultPosition: resultPosition).update()
        print("Args After update: ", args)
        print("Position before update: \(resultPosition)")
        print(resultValue!)
    }
} else {
    print("Error")     /* Placeholder */
}







