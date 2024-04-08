//
//  main.swift
//  Party(Gold_3)_Dijkstra
//
//  Created by Derrick kim on 2023/05/06.
//

import Foundation
typealias Edge = (dest: Int, dist: Int)

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let (N, M, X) = (input[0], input[1], input[2])

var graph = [[Edge]](repeating: [Edge](), count: N+1)

for _ in 0..<M {
    let data = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (start, end, time) = (data[0], data[1], data[2])
    graph[start].append(Edge(end, time))
}

func dijkstra(start: Int, end: Int) -> Int {
    var dist = Array(repeating: Int.max, count: N + 1)
    var visited = Array(repeating: false, count: N + 1)

    var pq = PriorityQueue<(node: Int, dist: Int)>(ordered: { $0.dist > $1.dist })

    pq.push((start, 0))

    while let (current, distance) = pq.pop() {
        guard current != end else {
            return distance
        }

        guard dist[current] >= distance,
              !visited[current] else {
            continue
        }

        visited[current] = true

        for (edge, d) in graph[current] where !visited[edge] {
            let nextDistance = distance + d

            if nextDistance < dist[edge] {
                dist[edge] = nextDistance
                pq.push((edge, nextDistance))
            }
        }
    }

    return dist[end]
}

var maxCost = 0

for S in 1...N where S != X {
    let cost = dijkstra(start: S, end: X) + dijkstra(start: X, end: S)

    if cost > maxCost {
        maxCost = cost
    }
}

print(maxCost)

struct PriorityQueue<T> {
    internal var heap = Array<T>()
    public let ordered: (T, T) -> Bool

    public init(ordered: @escaping (T, T) -> Bool) {
        self.ordered = ordered
    }

    var count: Int {
        return heap.count
    }

    var top: T? {
        return heap.first
    }

    var isEmpty: Bool {
        return heap.isEmpty
    }

    public mutating func push(_ element: T) {
        heap.append(element)
        swim(heap.count - 1)
    }

    public mutating func pop() -> T? {
        guard heap.count > 1 else {
            return heap.popLast()
        }
        heap.swapAt(0, heap.count - 1)
        let last = heap.removeLast()
        sink(0)

        return last
    }

    public mutating func sink(_ index: Int) { //힙의 재구성
        var index = index

        while 2 * index + 1 < heap.count {
            var j = 2 * index + 1 //왼쪽 자식 노드
            if j + 1 < heap.count && ordered(heap[j], heap[j+1]) { j += 1 }
            if !ordered(heap[index], heap[j]) { break }
            heap.swapAt(index, j)
            index = j
        }
    }

    public mutating func swim(_ index: Int) { //힙의 구성
        var index = index

        while index > 0 && ordered(heap[(index - 1) / 2], heap[index]) {
            heap.swapAt((index - 1) / 2, index)
            index = (index - 1) / 2
        }
    }
}
