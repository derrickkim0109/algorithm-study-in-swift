//
//  main.swift
//  LinkedSubSequenceSummary
//
//  Created by Derrick kim on 2023/04/10.
//

import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    let sequenceItemInvalidlength = sequence.filter { $0 < 1 || $0 > 1000 }.count

    guard (sequence.count >= 5 ||
           sequence.count <= 1000_000),
          sequenceItemInvalidlength == 0,
          (k >= 5 || k <= 1000_000_000) else {
        return []
    }

    var answer: [Int] = []
    var summary: [Int] = Array(repeating: 0, count: sequence.count + 1)

    summary[0] = 0

    for i in 0..<sequence.count {
        summary[i+1] = summary[i] + sequence[i]
    }

    var left = 0
    var right = 0
    var currentIndex = Int.max

    while left <= right {
        if right == summary.count {
            break
        }

        var part = summary[right] - summary[left]

        if part == k {
            if (currentIndex > right - left) {
                answer = [left, right - 1]
                currentIndex = right - left
            }

            right += 1
        } else if part < k {
            right += 1
        } else {
            left += 1
        }
    }

    return answer
}

print(solution([1, 1, 1, 2, 3, 4, 5], 5))
print(solution([1, 2, 3, 4, 5], 7))
print(solution([2, 2, 2, 2, 2], 6))

func solution1(_ sequence:[Int], _ k:Int) -> [Int] {
    var pSum = [0]
    
    for number in sequence {
        pSum.append(pSum.last! + number)
    }

    var left = 0
    var right = 0

    var candidate: [[Int]] = []

    while left < sequence.count && right < sequence.count {
        let sum = pSum[right + 1] - pSum[left]

        if sum == k {
            candidate.append([left, right])
            right += 1
        } else if sum < k {
            right += 1
        } else {
            left += 1
        }
    }

    return candidate.sorted(by: { a, b in
        let lengthA = a[1] - a[0] + 1
        let lengthB = b[1] - b[0] + 1

        if lengthA == lengthB {
            return a[0] < b[0]
        }
        return lengthA < lengthB
    }).first!
}


func solution2(_ sequence:[Int], _ k:Int) -> [Int] {
    var answer: [Int] = []
    var candidates: [Int] = [sequence[0]]

    for index in 1..<sequence.count {
        let num = candidates.last! + sequence[index]
        candidates.append(num)
    }

    var left = 0
    var right = 0

    while left <= right && right < sequence.count {
        let leftValue = candidates[left]
        let rightValue = candidates[right]
        let value = rightValue - leftValue + sequence[left]

        if value == k {
            if answer.isEmpty {
                answer = [left, right]
            } else if (answer[1] - answer[0]) > (right - left) {
                answer = [left, right]
            }
        }

        if left == right {
            right += 1
        } else if value > k {
            left += 1
        } else {
            right += 1
        }
    }

    return answer
}
