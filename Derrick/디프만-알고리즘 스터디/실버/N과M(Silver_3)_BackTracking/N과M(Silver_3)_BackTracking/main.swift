//
//  main.swift
//  N과M(Silver_3)_BackTracking
//
//  Created by Derrick kim on 2023/05/15.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let N = input[0]
let M = input[1]
var data = Array(repeating: 0, count: 10)
var visited = Array(repeating: false, count: 10)

func backTracking(_ k: Int) {
    if (k == M) {
        for i in 0..<M {
            print(data[i], terminator: " ")
        }
        print("")
        return
    }

    for i in 1...N {
        if visited[i] == false {
            data[k] = i
            visited[i] = true

            backTracking(k+1)
            visited[i] = false
        }
    }
}

backTracking(0)
