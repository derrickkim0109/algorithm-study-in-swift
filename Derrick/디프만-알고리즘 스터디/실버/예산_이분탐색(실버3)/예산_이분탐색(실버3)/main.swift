//
//  main.swift
//  예산_이분탐색(실버3)
//
//  Created by Derrick kim on 2023/04/23.
//

import Foundation

let input = Int(readLine()!)!
var budgets = readLine()!.split(separator: " ").map { Int($0)! }
var target = Int(readLine()!)!

budgets.sort()

func solution(_ array: [Int], target: Int) -> Int {
    var low = 0
    var high = array.last!
    var result = 0

    while low <= high {
        let mid = (low + high) / 2
        var guessValue = 0

        for value in array {
            if mid <= value {
                guessValue += mid
            } else {
                guessValue += value
            }
        }

        if guessValue <= target {
            low = mid + 1
            result = mid
        } else {
            high = mid - 1
        }
    }

    return result
}

print(solution(budgets, target: target))
