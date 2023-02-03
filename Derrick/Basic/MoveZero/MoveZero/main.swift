//
//  main.swift
//  MoveZero
//
//  Created by Derrick kim on 2023/02/03.
//

import Foundation

func moveZero(array: [Int]) -> [Int] {
    var numbers = array
    var wIndex = 0

    for index in 0..<numbers.count {
        if numbers[index] != 0 {
            numbers[wIndex] = numbers[index]
            wIndex += 1
        }
    }

    for index in wIndex..<numbers.count {
        numbers[index] = 0
    }

    return numbers
}

print(moveZero(array: [0,1,0,3,0,4,0]))
//print(moveZero(array: [1,0,3,0,4,0,5,2]))

