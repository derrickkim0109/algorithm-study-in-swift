//
//  main.swift
//  Shortest Path
//
//  Created by Derrick kim on 3/14/24.
//

import Foundation

// 1 -> 3
// 1 -> 4
// 2 -> 3
// 3 -> 4
// 4 -> 5

// 1 -> 2 ?
// 1 -> 3 -> 2 2단계만에
// 1 -> 3 1단계
// 1 -> 4. 1단계
// 1 -> 4 -> 5 2단계
// 2 + 1 + 1 + 2 = 6

struct Heap<T> {
    var nodes = [T]()
    var sort: (T, T) -> Bool

    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }

    var isEmpty: Bool {
        return nodes.isEmpty
    }

    var count: Int {
        return nodes.count
    }

    var peek: T? {
        return nodes.first
    }

    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }

    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }

    func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }

    mutating func insert(_ value: T) {
        nodes.append(value)

        shiftUp(from: nodes.count - 1)
    }

    mutating func remove() -> T? {
        guard !isEmpty else {
            return nil
        }

        if count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(from: 0, until: count)
            return value
        }
    }
}

extension Heap {
    mutating func shiftUp(from index: Int) {
        var childIndex = index
        var childNode = nodes[childIndex]
        var parentIndex = self.parentIndex(of: childIndex)

        while childIndex > 0, sort(childNode, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }

        nodes[childIndex] = childNode
    }

    mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = leftChildIndex(of: index)
        let rightChildIndex = rightChildIndex(of: index)
        var first = index

        if leftChildIndex < endIndex, sort(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }

        if rightChildIndex < endIndex, sort(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }

        if first == index {
            return
        }

        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
}

//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let n = input[0]
//let m = input[1]
//
//var graph = Array(repeating: [Int](), count: n + 1)
//
//for _ in 0..<m {
//    let edge = readLine()!.split(separator: " ").map { Int($0)! }
//    graph[edge[0]].append(edge[1])
//    graph[edge[1]].append(edge[0])
//}
//
//func bfs(_ start: Int) -> Int {
//    var visited = Array(repeating: false, count: n + 1)
//    var queue: [(Int, Int)] = [(start, 0)]
//    var index = 0
//    var result = 0
//
//    visited[start] = true
//
//    while queue.count > index {
//        let (current, distance) = queue[index]
//
//        index += 1
//
//        result += distance
//
//        for next in graph[current] {
//            if !visited[next] {
//                visited[next] = true
//                queue.append((next, distance + 1))
//            }
//        }
//    }
//
//    return result
//}
//
//var answer = (index: 0, bacon: Int.max)
//
//for i in 1...n {
//    let bacon = bfs(i)
//
//    if bacon < answer.bacon {
//        answer = (i, bacon)
//    }
//}
//
//print(answer.index)

let input = readLine()!.split(separator: " ").map { Int($0)!}

let n = input[0] // 도시의 개수
let m = input[1] // 도로의 개수
let k = input[2] // 거리 정보
let x = input[3] // 출발 도시의 번호

var graph = Array(repeating: [Int](), count: n + 1)
var distance = Array(repeating: -1, count: n + 1)
var visited = Array(repeating: false, count: n + 1)

for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let startCity = edge[0]
    let destinationCity = edge[1]

    graph[startCity].append(destinationCity)
}


var queue: [Int] = [x]
visited[x] = true
distance[x] = 0

while !queue.isEmpty {
    let v = queue.removeFirst()

    for city in graph[v] {
        if !visited[city] {
            distance[city] = distance[v] + 1
            visited[city] = true
            queue.append(city)
        }
    }
}

var answer: [Int] = []

for (index, distance) in distance.enumerated() {
    if distance == k {
        answer.append(index)
    }
}

if answer.count == 0 {
    print(-1)
} else {
    answer.forEach { print($0) }
}
