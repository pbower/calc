//
//  UpdateInput.swift
//  calc
//
//  Created by Peter Bower on 21/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

struct UpdateInput {
    
    let input: [String]
    let resultValue: Int?
    let resultPosition: Int
    
    func update() -> [String] {
        
        if resultPosition == 0 && input.count == 1 {                                    //Result is the final result
            return  ["\(resultValue!)"]
            
        } else if resultPosition == 0 && input.count > 1 {                              //Result is on the left of the input array
            return ["\(resultValue!)"]  + Array(input[resultPosition + 3...input.count - 1])
            
        } else if resultPosition > 0 && resultPosition < input.count-1  {               //Result is in the middle of further calculations
            return Array(input[0...resultPosition - 1]) + ["\(resultValue!)"] + Array(input[resultPosition + 3...input.count - 1])
            
        } else if resultPosition == input.count - 1 && input.count > 1 {                //Result is on the right of the input array
            return Array(input[0...resultPosition - 1]) + ["\(resultValue!)"]
            
        } else {
            return ["Error"]                                                            /* Placeholder before implementing exception handling */
        }
    }
}




