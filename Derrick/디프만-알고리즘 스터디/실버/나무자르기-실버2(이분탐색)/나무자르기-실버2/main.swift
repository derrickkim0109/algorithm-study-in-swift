//
//  main.swift
//  나무자르기-실버2
//
//  Created by Derrick kim on 2023/04/18.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let treeCount = input[0]
let requiredLength = input[1]
var treeHeights: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

// O(nlogn)
treeHeights.sort()

func binarySearch(_ array: [Int], requiredNumber: Int) -> Int {
    var low = 1
    var high = array.last!
    var result = 0

    while low <= high {
        let mid = (low + high) / 2
        var guessValue = 0

        for value in array {
            if value - mid > 0 {
                // 자르고 남은 나무 길이
                guessValue += value - mid
            }
        }

        if guessValue < requiredNumber {
            high = mid - 1
        } else {
            low = mid + 1
            result = mid
        }
    }

    return result
}

print(binarySearch(treeHeights, requiredNumber: requiredLength))
