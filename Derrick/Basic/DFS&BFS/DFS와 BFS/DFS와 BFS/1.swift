//
//  1.swift
//  DFS와 BFS
//
//  Created by Derrick kim on 2/26/24.
//

import Foundation

func solution1(_ numbers:[Int]) -> Int {
    var visited: [Int: Int] = [:]
    var answer = 0
    var i = 0

    while i < numbers.count {
        if visited[i] == nil { visited.updateValue(0, forKey: i) }

        if visited[i] == 0 { break }

        let currentValue = numbers[i]
        var count = 0

        for number in numbers {
            if number == currentValue {
                count += 1
            }
        }
        visited[i] = count
        answer += 1
        i = count
    }
    return answer
}
