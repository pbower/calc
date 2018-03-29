//
//  validation.swift
//  calc
//
//  Created by Peter Bower on 29/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

struct Validation {                                                         //Validation struct is used to perform checks on calc input and result of each pass to identify exceptions
    
    let args: [String]
    let index = 0
    
    func checkInputIsValid() {                                              //func checks input arguments to ensure they are valid
        if (args.count % 2 == 0) {                                          //check for case invalid argument count
            ExceptionHandling(errInput: "").incompleteExpression()
        }
        if (args.count == 1 && Int(args[0]) == nil)  {                      //check for case non-numerical single character input
            ExceptionHandling(errInput: args[index]).invalidInput()
        }
        for index in stride(from: 0, to: args.count-2, by: 2) {             //check for case non-integers, and/or nil args in array positions that require numbers
            if Int(args[index]) == nil {
                ExceptionHandling(errInput: args[index]).invalidInput()
            }
        }
        isOutOfBounds()
    }
    
    func isOutOfBounds() {                                                  //use case 1: initial argument validation
        for index in stride(from: 0, to: args.count, by: 1) {               //use case 2: check if calculation result is out of bounds
            if let integerSize = Int(args[index]) {
                if integerSize > Int32.max || integerSize < Int32.min {
                    ExceptionHandling(errInput: (args.joined(separator: " "))).integerOverflow()
                }
            }
        }
    }
}
