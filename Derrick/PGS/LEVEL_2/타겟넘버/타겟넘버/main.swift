//
//  main.swift
//  타겟넘버
//
//  Created by Derrick kim on 2023/04/12.
//

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0

    func dfs(_ numbers: [Int], _ target: Int, _ sum: Int, _ index: Int) {
        if index >= numbers.count {
            if sum == target {
                count += 1
            }
        }
        dfs(numbers, target, sum + numbers[index], index + 1)
        
    }

    return count
}



func DFS1(graph: [String: [String]], start: String) -> [String] {
    var visitedQueue: [String] = []
    var needVisitStack: [String] = [start]
    while !needVisitStack.isEmpty {
        let node: String = needVisitStack.removeLast()

        if visitedQueue.contains(node) {
            continue
        }

        visitedQueue.append(node)
        needVisitStack += graph[node] ?? []
    }

    return visitedQueue
}


func BFS(_ graph: [String: [String]], start: String) -> [String] {
    var visitedQueue: [String] = []
    var needVisitQueue: [String] = [start]

    while !needVisitQueue.isEmpty {
        let node: String = needVisitQueue.removeFirst()

        if visitedQueue.contains(node) {
            continue
        }

        visitedQueue.append(node)
        needVisitQueue += graph[node] ?? []
    }

    return visitedQueue
}
