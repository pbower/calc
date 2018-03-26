//
//  UpdateArgs.swift
//  calc
//
//  Created by Peter Bower on 21/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

struct UpdateArgs {
    
    let args: [String]
    let resultValue: Int?
    let resultPosition: Int
    
    func update() -> [String] {                                                        //Return result and any args that haven't been processed yet
        
        if resultPosition == 0 && args.count == 3 {                                    //If result is the final result, return the value
            return  ["\(resultValue!)"]
            
        } else if resultPosition == 0 && args.count > 1 && args.count > 3 {            //Handles scenario where result is on the left of the args array
            return ["\(resultValue!)"]  + Array(args[resultPosition + 3...args.count - 1])
            
        } else if resultPosition > 0 && resultPosition < args.count-3  {               //Handles scenario where result is in the middle of further calculations
            return Array(args[0...resultPosition - 1]) + ["\(resultValue!)"] + Array(args[resultPosition + 3...args.count - 1])
            
        } else  {
            return Array(args[0...resultPosition - 1]) + ["\(resultValue!)"]            //Handles scenario where result is on the right of the args array, but is not the last calc pass
            
        }
    }
}



