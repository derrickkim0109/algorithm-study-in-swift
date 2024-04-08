//
//  main.swift
//  MakeMinimumValue
//
//  Created by Derrick kim on 2023/04/11.
//

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int {
    var sortedA = A.sorted()
    var sortedB = B.sorted()
    var minSummary = 0

    for _ in 0..<A.count {
        minSummary += (sortedA.removeFirst() * sortedB.removeLast())
    }

    return minSummary
}

print(solution([1,4,2], [5,4,4]))
print(solution([1,2], [3,4]))
