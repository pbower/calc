//
//  ReadInput.swift
//  calc
//
//  Created by Peter Bower on 19/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

struct ReadInput {
    
let input: String
    
    //Convert input string to array to isolate input components for processing
    func readInput () -> Array<String> {
        return output
    }
        
    //Provide facility to isolate integers as an array for validation and input exception handling
    func strToInt (_ input: [String]) -> [Int] {
        let output = input.map {Int($0)}.filter{$0 != nil}.map { $0! }
        return output
    }


}


