//
//  main.swift
//  N과M(2)_(Silver3)_BackTracking
//
//  Created by Derrick kim on 2023/05/16.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let N = input[0]
let M = input[1]
var data: [Int] = []
var visited = Array(repeating: false, count: N + 1)

func solution(k: Int) {
    if k == M {
        if data.sorted() == data {
            let result = data.map { String($0) }.joined(separator: " ")
            print(result)
            return
        } else {
            return
        }
    }

    for i in 1...N {
        if visited[i] == false {
            visited[i] = true
            data.append(i)
            solution(k: k+1)
            visited[i] = false
            data.removeLast()
        }
    }
}

solution(k: 0)
