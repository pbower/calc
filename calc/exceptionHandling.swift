//
//  exceptionHandling.swift
//  calc
//
//  Created by Peter Bower on 19/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

struct ExceptionHandling {                                           //Exception Handling is centralised for easy maintenance
    
    let errInput: String
    
    enum CalcError: Error {                                          //Setup error types
        case invalidInput
        case integerOverflow
        case divByZero
        case unknownOperator
        case incompleteExpression
    }
    
    func invalidInput() {                                            //error handling functions
        do {
            throw CalcError.invalidInput
        } catch {
            print("Invalid number: \(errInput)")
            exit(1)
        }
    }
    
    func integerOverflow() {
        do {
            throw CalcError.integerOverflow
        } catch {
            print("Integer Overflow")
            exit(2)
        }
    }
    
    func divByZero() {
        do {
            throw CalcError.divByZero
        } catch {
            print("Division by zero")
            exit(3)
        }
    }
    
    func unknownOperator() {
        do {
            throw CalcError.unknownOperator
        } catch {
            print("Unknown operator: \(errInput)")
            exit(4)
        }
    }
    
    func incompleteExpression() {
        do {
            throw CalcError.incompleteExpression
        } catch {
            print("Incomplete expression. Expected input of the form [number] [operator number ...]")
            exit(5)
        }
    }
}


