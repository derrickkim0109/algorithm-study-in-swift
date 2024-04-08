//
//  main.swift
//  Virus_Silver3(DFS&BFS)
//
//  Created by Derrick kim on 2023/04/25.
//

import Foundation

let computerAmount = Int(readLine()!)!
let pairsAmount = Int(readLine()!)!
var graph: [[Int]] = Array(repeating: [], count: computerAmount + 1)

for _ in 0..<pairsAmount {
    let info = readLine()!.split(separator: " ").map { Int($0)! }

    let first = info[0]
    let second = info[1]

    graph[first].append(second)
    graph[second].append(first)
}

func DFS(_ graph: [[Int]], _ start: Int) -> Int {
    var visited = [Int]()
    var stack = [start]

    while !stack.isEmpty {
        let node = stack.popLast()!

        for next in graph[node] {
            if !visited.contains(next) {
                visited.append(next)
                stack.append(next)
            }
        }
    }

    return visited.count - 1
}

func BFS(_ graph: [[Int]], _ start: Int) -> Int {
    var visited = [Int]()
    var queue = [start]

    while !queue.isEmpty {
        let node = queue.removeFirst()

        for next in graph[node] {
            if !visited.contains(next) {
                visited.append(next)
                queue.append(next)
            }
        }
    }

    return visited.count - 1
}

print(DFS(graph, 1))
print(BFS(graph, 1))
