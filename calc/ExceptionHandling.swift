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
    case divZero
    case numOutOfBounds
}

struct CheckInput {
    
    let input: [String]
    let index = 0
    
    func checkInputIsValid() throws {
        if input.count == 1 {
            throw CalcError.invalidInput
        }
        if input.count % 2 == 0 {
            throw CalcError.invalidInput
        }
        for index in stride(from: 0, to: input.count-2, by: 2) {
            if Int(input[index]) != nil {
            } else {
                throw CalcError.invalidInput
            }
        }
        for index in stride(from: 1, to: input.count-2, by: 2) {
            if input[index] != "x"
            && input[index] != "/"
            && input[index] != "+"
            && input[index] != "-"
            && input[index] != "%" {
                throw CalcError.invalidInput
            }
        }
    }
    func isOutOfBounds() throws {
        for index in stride(from: 0, to: input.count, by: 1) {
            if let integerSize = Int(input[index]) {
                if integerSize > Int32.max || integerSize < Int32.min {
                    throw CalcError.numOutOfBounds
                }
            }
        }
    }
}



