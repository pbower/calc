//
//  ExceptionHandling.swift
//  calc
//
//  Created by Peter Bower on 19/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

enum CalcError: Error {
    case invalidInput
    case numOutOfBounds
}

struct ErrorCheckCalls {
    
    let args: [String]
    let index = 0
    
    func checkInputIsValid() throws {
        if (args.count == 1 && Int(args[0]) == nil)                    //check for nil args
            || (args.count % 2 == 0) {                                 //check for invalid arg count
            throw CalcError.invalidInput
        }
        for index in stride(from: 0, to: args.count-2, by: 2) {        //check for nil args in array positions that require numbers
            if Int(args[index]) == nil {
                throw CalcError.invalidInput
            }
        }
    }
    
    func isOutOfBounds() throws {                                      //check if calc result is out of bounds
        for index in stride(from: 0, to: args.count, by: 1) {
            if let integerSize = Int(args[index]) {
                if integerSize > Int32.max || integerSize < Int32.min {
                    throw CalcError.numOutOfBounds
                }
            }
        }
    }
}



