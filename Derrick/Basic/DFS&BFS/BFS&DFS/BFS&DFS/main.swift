//
//  main.swift
//  BFS&DFS
//
//  Created by Derrick kim on 2/22/24.
//

import Foundation

// 그래프를 표현하는 방법
let graph: [String: [String]] = [
    "A": ["B", "C"],
    "B": ["A", "D", "E"],
    "C": ["A", "E"],
    "D": ["B"],
    "E": ["B", "C"]
]

//func bfs(start: String, graph: [String: [String]]) {
//    var visited: [String] = [] // 방문한 정점을 저장하는 배열
//    var queue = [start] // 큐를 사용하여 방문할 정점을 저장한다.
//
//    while !queue.isEmpty {
//        let current = queue.removeFirst() // 큐에서 정점을 꺼낸다.
//        if !visited.contains(current) {
//            print("bfs Visited vertex: \(current)")
//
//            visited.append(current) // 정점 방문
//
//            // 현재 정점의 인접 정점을 큐에 추가
//            if let neighbors = graph[current] {
//                for neighbor in neighbors {
//                    if !visited.contains(neighbor) {
//                        queue.append(neighbor)
//                    }
//                }
//            }
//        }
//    }
//}


func BFS(start: String, graph: [String: [String]]) -> [String] {
    var visited: [String] = []
    var queue: [String] = [start]

    while !queue.isEmpty {
        let node: String = queue.removeFirst()

        if visited.contains(node) {
            continue
        }

        visited.append(node)
        queue += graph[node] ?? []
    }

    return visited
}

// DFS 함수 구현
func DFS(start: String, graph: [String: [String]]) -> [String] {
    var visited: [String] = []
    var stack: [String] = [start]

    while !stack.isEmpty {
        let node: String = stack.removeLast()

        if visited.contains(node) {
            continue
        }

        visited.append(node)
        stack += graph[node] ?? []
    }

    return visited
}


print(DFS(start: "A", graph: graph))
print(BFS(start: "A", graph: graph))
