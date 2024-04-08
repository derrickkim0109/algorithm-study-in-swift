//
//  origin.swift
//  DFS와 BFS
//
//  Created by Derrick kim on 2/26/24.
//

import Foundation

//func DFS(_ graph: [[Int]], _ start: Int) {
//    var visited = [Int]()
//    var stack = [start]
//
//    while !stack.isEmpty {
//        let node = stack.popLast()!
//
//        if !visited.contains(node) {
//            visited.append(node)
//            print(node, terminator: " ")
//            stack.append(contentsOf: graph[node].sorted(by: >))
//        }
//    }
//}
//
//func BFS(_ graph: [[Int]], _ start: Int) {
//    var visited = [Int]()
//    var queue = [start]
//
//    while !queue.isEmpty {
//        let node = queue.removeFirst()
//
//        if !visited.contains(node) {
//            visited.append(node)
//            print(node, terminator: " ")
//            queue.append(contentsOf: graph[node].sorted())
//        }
//    }
//}
//
//let numbersInfo = readLine()!.split(separator: " ").map { Int($0)! }
//
//let N = numbersInfo[0] // 정점 개수 // Node
//let M = numbersInfo[1] // 간선 개수 // branch
//let V = numbersInfo[2] // 탐색을 시작할 정점 번호
//
//var graph: [[Int]] = Array(repeating: [], count: N + 1)
//
//for _ in 0..<M {
//    let relation = readLine()!.split(separator: " ").map { Int($0)! }
//    let firstPoint = relation[0]
//    let secondPoint = relation[1]
//
//    graph[firstPoint].append(secondPoint)
//    graph[secondPoint].append(firstPoint)
//}
////4 5 1
////1 2
////1 3
////1 4
////2 4
////3 4
//
//print(graph)
//
//DFS(graph, V)
//print()
//BFS(graph, V)
