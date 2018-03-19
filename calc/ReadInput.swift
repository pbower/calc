//
//  ReadInput.swift
//  calc
//
//  Created by Peter Bower on 19/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

struct ReadInput {

    let input: [String]
    
    func trimInput() -> [String] {
        let output = Array(input[3...input.count-1])
        return output
    }
}


