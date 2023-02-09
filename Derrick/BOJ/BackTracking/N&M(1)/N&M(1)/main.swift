//
//  main.swift
//  N&M(1)
//
//  Created by Derrick kim on 2023/02/09.
//

import Foundation

let inputValueAndTargetNumber = readLine()!.split(separator: " ").map{ Int($0) }
let data = Array(1...inputValueAndTargetNumber[0]!)
let target = inputValueAndTargetNumber[1]!
var visit = [Bool](repeating: false, count: data.count)

var result = [String]()

func dfs(data: [Int], currentIndex: Int, currentCount: Int, target: Int, answer: String) {
    if currentCount == target {
        result.append(answer)
        return
    }

    for index in 0..<data.count {
        if visit[index] == false {
            visit[index] = true
            dfs(data: data, currentIndex: index, currentCount: currentCount + 1, target: target, answer: answer + "\(data[index]) ")
            visit[index] = false
        }
    }
}

dfs(data: data, currentIndex: 0, currentCount: 0, target: target, answer: "")

for value in result {
    print(value)
}
