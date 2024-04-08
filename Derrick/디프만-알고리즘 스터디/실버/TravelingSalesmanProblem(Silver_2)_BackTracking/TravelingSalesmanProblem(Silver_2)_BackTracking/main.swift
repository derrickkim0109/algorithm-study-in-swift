//
//  main.swift
//  TravelingSalesmanProblem(Silver_2)_BackTracking
//
//  Created by Derrick kim on 2023/05/16.
//

import Foundation

let n = Int(readLine()!)!
var W = Array(repeating: Array(repeating: 0, count: n), count: n)

for i in 0..<n {
    let a = readLine()!.split(separator:" ").map {Int(String($0))!}
    W[i] = a
}

var minSum = 10000000
var result = [Int]()
var visited = Array(repeating: false, count: n)

func solution(_ k: Int, _ destination: Int) {
    if result.count == n && k == destination {
        minSum = min(minSum, result.reduce(0, {$0+$1}))
        return
    }

    for i in 0..<n {
        if visited[i] == false && W[k][i] > 0 {
            result.append(W[k][i])
            visited[i] = true
            solution(i,destination)
            result.removeLast()
            visited[i] = false
        }

    }
}

solution(0,0)
print(minSum)
