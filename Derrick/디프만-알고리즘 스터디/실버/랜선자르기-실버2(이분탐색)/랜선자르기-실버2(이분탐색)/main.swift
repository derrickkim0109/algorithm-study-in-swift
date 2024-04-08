//
//  main.swift
//  랜선자르기-실버2(이분탐색)
//
//  Created by Derrick kim on 2023/04/18.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let lanLineCount = input[0]
let requiredLanLine = input[1]

var lines: [Int] = []

for _ in 0..<lanLineCount {
    let line = Int(readLine()!)!
    lines.append(line)
}

lines.sort()

func binarySearch(_ array: [Int], target: Int) -> Int {
    var low = 1
    var high = array.max()!
    var result = 0

    while low <= high {
        var guessValue = 0
        let mid = (low + high) / 2

        for value in array {
            guessValue += (value / mid)
        }

        if guessValue < target {
            high = mid - 1
        } else {
            low = mid + 1
            result = mid
        }
    }

    return result
}

print(binarySearch(lines, target: requiredLanLine))
