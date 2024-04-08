//
//  main.swift
//  SpecificShortestPath(Gold4)_Dijkstra
//
//  Created by Derrick kim on 2023/05/06.
//

import Foundation

struct Heap<T: Comparable> {
    private var nodes: [T] = []
    private let sort: (T,T) -> Bool

    init(sort: @escaping (T,T) -> Bool) {
        self.sort = sort
    }

    var isEmpty: Bool {
        nodes.isEmpty
    }

    mutating func insert(_ element: T) {
        var index = nodes.count
        nodes.append(element)

        while index > 0 , sort(nodes[index], nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }

    mutating func delete() -> T {
        if nodes.count == 1 {
            return nodes.removeLast()
        }

        let result = nodes.first!
        nodes.swapAt(0, nodes.count - 1)
        _ = nodes.popLast()

        var index = 0

        while index < nodes.count {
            let leftChild = index * 2 + 1
            let rightChild = leftChild + 1

            let children = [leftChild, rightChild]
                .filter{$0 < nodes.count && sort(nodes[$0], nodes[index])}
                .sorted{sort(nodes[$0], nodes[$1])}

            if children.isEmpty {
                break
            }

            nodes.swapAt(index, children[0])
            index = children[0]
        }

        return result
    }
}
struct EdgeData: Comparable {
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
        return lhs.cost < rhs.cost
    }
    let cost: Int
    let node: Int
}

let ne = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,e) = (ne[0],ne[1])

var graph = Array(repeating: [(Int,Int)](), count: n+1)

for _ in 0..<e {
    let abc = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (a,b,c) = (abc[0],abc[1],abc[2])
    graph[a].append((b,c))
    graph[b].append((a,c))
}

let v = readLine()!.split(separator: " ").map{Int(String($0))!}
let (v1,v2) = (v[0],v[1])

func dijkstra(start: Int) -> [Int] {
    var distance = Array(repeating: Int.max, count: n+1)
    distance[start] = 0

    var pq = Heap<EdgeData>(sort: <)
    pq.insert(EdgeData(cost: 0, node: start))


    while !pq.isEmpty {
        let current = pq.delete()
        let (curNode, curDist) = (current.node, current.cost)

        if distance[curNode] < curDist {
            continue
        }

        for (nxNode, nxCost) in graph[curNode] {
            let nextDistance = curDist + nxCost

            if nextDistance < distance[nxNode] {
                distance[nxNode] = nextDistance
                pq.insert(EdgeData(cost: nextDistance, node: nxNode))
            }
        }
    }
    return distance
}


let dist1 = dijkstra(start: 1)
let dist2 = dijkstra(start: v1)
let dist3 = dijkstra(start: v2)

let first = dist1[v1] + dist2[v2] + dist3[n]
let second = dist1[v2] + dist3[v1] + dist2[n]

let ans = min(first,second)

print(ans >= Int.max ? -1 : ans)
