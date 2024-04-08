//
//  main.swift
//  TheShortestPath(Gold_4)_Dijkstra
//
//  Created by Derrick kim on 2023/05/03.
//

import Foundation

struct Heap <T: Comparable> {
    var heap = [T]()

    private func getParent(_ index: Int) -> T {
        heap[index / 2]
    }

    private func getLeftChild(_ index: Int) -> T {
        heap[index * 2]
    }

    private func getRightChild(_ index: Int) -> T {
        heap[index * 2 + 1]
    }

    func isEmpty() -> Bool {
        heap.count <= 1
    }

    mutating func push(_ data: T) {
        if isEmpty() { heap.append(data) }
        var index = heap.count
        heap.append(data)

        while index > 1 {
            let parent = getParent(index)
            guard parent > data else { break }
            heap[index] = parent
            index /= 2
        }
        heap[index] = data
    }

    mutating func pop() -> T? {
        guard !isEmpty() else { return nil }
        let item = heap[1]
        let data = heap.removeLast()
        let size = heap.count - 1

        guard !isEmpty() else { return item }
        var (parent, child) = (1, 2)
        while child <= size {
            if child < size && getLeftChild(parent) > getRightChild(parent) {
                child += 1
            }
            guard data > heap[child] else { break }
            heap[parent] = heap[child]
            parent = child
            child *= 2
        }
        heap[parent] = data
        return item
    }
}
struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.cost < rhs.cost
    }

    let node: Int
    let cost: Int
}

let input = readLine()!.split { $0 == " " }.map { Int($0)! }
let (V, E) = (input[0], input[1])

let start = Int(readLine()!)!
var graph = [Int: [Node]]()
var result = [Int](repeating: Int.max, count: V+1)
for i in 1...V {
    graph[i] = []
}

for _ in 0 ..< E {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    let (start, end, cost) = (input[0], input[1], input[2])
    graph[start]!.append(Node(node: end, cost: cost))
}

dijkstra(start)
for i in 1...V {
    print(result[i] == Int.max ? "INF" : result[i])
}

func dijkstra(_ start: Int) {
    var queue = Heap<Node>()
    var visited = [Bool](repeating: false, count: V + 1)
    result[start] = 0
    queue.push((Node(node: start, cost: 0)))

    while let current = queue.pop() {
        let (node, cost) = (current.node, current.cost)

        guard !visited[node] else { continue }

        visited[node] = true

        if let edge = graph[node] {
            for next in edge {
                let (nextNode, nextCost) = (next.node, next.cost)

                guard !visited[nextNode] else { continue }

                let newCost = cost + nextCost

                if newCost < result[nextNode] {
                    result[nextNode] = newCost
                    queue.push(Node(node: nextNode, cost: newCost))
                }
            }
        }
    }
}
