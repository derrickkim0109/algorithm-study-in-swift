//
//  main.swift
//  Depth_First_Search
//
//  Created by Derrick kim on 2023/02/01.
//

import Foundation

//let rawData = "0123"
//let data = rawData.map { String($0) }
//var visit = [Bool](repeating: false, count: data.count)
//
//func dfs_comb(data: [String], curInd: Int, curCnt: Int, targetCnt: Int, answer: String) {
//    if curCnt == targetCnt {
//        print(answer)
//    }
//
//    for i in curInd..<data.count {
//        if !visit[i] {
//            visit[i] = true
//            dfs_comb(data: data, curInd: i, curCnt: curCnt + 1, targetCnt: targetCnt, answer: answer + data[i])
//            visit[i] = false
//        }
//    }
//}
//
//
//func dfs(data: [String], curInd: Int, curCnt: Int, targetCnt: Int, answer: String) {
//    if curCnt == targetCnt {
//        print(answer)
//        return
//    }
//
//    for i in 0..<data.count {
//        if !visit[i] {
//            visit[i] = true
//            dfs(data: data, curInd: i, curCnt: curCnt + 1, targetCnt: targetCnt, answer: answer + data[i])
//            visit[i] = false
//        }
//    }
//}
//
//print(dfs_comb(data: data, curInd: 0, curCnt: 0, targetCnt: 2, answer: ""))
//let graph1 = [
//    [], // 0
//    [2,3], // 1
//    [1,4,5], // 2
//    [1,6,7], // 3
//    [2], // 4
//    [2], // 5
//    [3], // 6
//    [3,8], // 7
//    [7] // 8
//]
//
//var visited1 = Array.init(repeating: false, count: graph1.count)
//
//func dfs1(start: Int) {
//    visited1[start] = true
//
//    for i in graph1[start] {
//        if !visited1[i] {
//            dfs1(start: i)
//        }
//    }
//}
//// 1 2 3 4 5 6 7 8
//
//var queue = Queue<Int>()
//
//func bfs1(start: Int) {
//
//}
//
//struct Queue<T:Equatable> {
//    private let doublyLinkedList = DoublyLinkedList<T>()
//}
//
//extension Queue {
//    var peekFirst: T? {
//        return doublyLinkedList.first?.value
//    }
//
//    var isEmpty: Bool {
//        return doublyLinkedList.isEmpty
//    }
//
//    @discardableResult
//    func enqueue(_ element: T) -> Bool {
//        doublyLinkedList.append(element)
//        return true
//    }
//
//    func dequeue() throws -> T {
//        guard !doublyLinkedList.isEmpty,
//              let element = doublyLinkedList.first else {
//            throw QueueError.emptyData
//        }
//        return doublyLinkedList.remove(element)
//    }
//}
//
//final class DoublyLinkedList<T: Equatable> {
//    private var head: Node<T>?
//    private weak var tail: Node<T>?
//
//    var isEmpty: Bool {
//        return head == nil
//    }
//
//    var first: Node<T>? {
//        return head
//    }
//}
//
//extension DoublyLinkedList {
//    subscript(index: Int) -> T? {
//        guard var node = self.head else {
//            return nil
//        }
//
//        if index == 0 {
//            return node.value
//        }
//
//        for _ in 1...index {
//            allocate(to: &node)
//        }
//        return node.value
//    }
//}
//
//private extension DoublyLinkedList {
//    func allocate(to currentNode: inout Node<T>) {
//        if let nextCurrentNode = currentNode.next {
//            currentNode = nextCurrentNode
//        }
//    }
//
//    @discardableResult
//    func allocate(_ value: T, to node: inout Node<T>) -> Bool {
//        guard let next = node.next else {
//            return false
//        }
//        node = next
//        return false
//    }
//}
//
//extension DoublyLinkedList {
//    func append(_ value: T) {
//        let newNode = Node(value: value)
//
//        guard let tailNode = tail else {
//            head = newNode
//            tail = newNode
//            return
//        }
//
//        newNode.previous = tailNode
//        tailNode.next = newNode
//        tail = newNode
//    }
//
//    func remove(_ node: Node<T>) -> T {
//        let prev = node.previous
//        let next = node.next
//
//        if let prev = prev {
//            prev.next = next
//        } else {
//            head = next
//        }
//
//        next?.previous = prev
//
//        if next == nil {
//            tail = prev
//        }
//
//        node.previous = nil
//        node.next = nil
//
//        return node.value
//    }
//}
//
//final class Node<T: Equatable> {
//    var value: T
//    var previous: Node<T>?
//    var next: Node<T>?
//
//    init(value: T) {
//        self.value = value
//    }
//}
//enum QueueError: Error {
//    case emptyData
//}

//5
//RRRBB
//GGBBB
//BBBRR
//BBRRR
//RRRRR
//4 3
//enum Person {
//    case normal // 적록색약이 아닌 사람
//    case nonNormal // 적록색약인 사람
//}
//
//let n = Int(readLine()!)! // 배열의 크기
//
//var graph = Array(repeating: Array(repeating: "", count: n), count: n) // 색깔 정보를 저장할 2차원 배열
//var normalVisited = Array(repeating: Array(repeating: false, count: n), count: n) // 적록색약이 아닌 사람이 방문한 정보
//var nonNormalVisited = Array(repeating: Array(repeating: false, count: n), count: n) // 적록색약인 사람이 방문한 정보
//
//let dx = [-1, 1, 0, 0] // x축 이동 (상, 하)
//let dy = [0, 0, -1, 1] // y축 이동 (좌, 우)
//
//var normalCount = 0 // 적록색약이 아닌 사람이 볼 수 있는 구역의 수
//var nonNormalCount = 0 // 적록색약인 사람이 볼 수 있는 구역의 수
//
//// 그래프 입력 받기
//for i in 0..<n {
//    let colors = readLine()!.map { String($0) }
//    graph[i] = colors
//}
//
//func dfs(_ x: Int, _ y: Int, _ type: Person) {
//    let current = graph[x][y]
//
//    for i in 0..<4 {
//        let nextX = x + dx[i]
//        let nextY = y + dy[i]
//
//        guard nextX >= 0,
//              nextX < n,
//              nextY >= 0,
//              nextY < n else {
//            continue
//        }
//
//        let nextNode = graph[nextX][nextY]
//
//        switch type {
//        case .normal:
//            normalVisited[x][y] = true
//
//            // R과 G를 같은 색으로 간주하는 경우 (적록색약인 사람)
//            guard !normalVisited[nextX][nextY],
//                    current == nextNode ||
//                    ((current == "R" || current == "G")
//                     && (nextNode == "R" || nextNode == "G")) else {
//                continue
//            }
//            dfs(nextX, nextY, .normal)
//        case .nonNormal:
//            nonNormalVisited[x][y] = true
//
//            // 같은 색인 경우에만 이동 (적록색약인 사람의 시각에서는 R과 G도 같은 색으로 처리)
//            guard !nonNormalVisited[nextX][nextY],
//                  current == nextNode else {
//                continue
//            }
//            dfs(nextX, nextY, .nonNormal)
//        }
//    }
//}
//
//func bfs(_ startX: Int, _ startY: Int, _ type: Person) {
//    var queue: [(Int, Int)] = [(startX, startY)]
//
//    // 시작 지점 방문 처리
//    switch type {
//    case .normal:
//        normalVisited[startX][startY] = true
//    case .nonNormal:
//        nonNormalVisited[startX][startY] = true
//    }
//
//    while !queue.isEmpty {
//        let (x, y) = queue.removeFirst()
//        let current = graph[x][y]
//
//        for i in 0..<4 {
//            let nextX = x + dx[i]
//            let nextY = y + dy[i]
//
//            guard nextX >= 0,
//                  nextX < n,
//                  nextY >= 0,
//                  nextY < n else {
//                continue
//            }
//
//            let nextNode = graph[nextX][nextY]
//
//            switch type {
//            case .normal:
//                guard !normalVisited[nextX][nextY],
//                        current == nextNode ||
//                        ((current == "R" || current == "G")
//                         && (nextNode == "R" || nextNode == "G")) else {
//                    continue
//                }
//
//                normalVisited[nextX][nextY] = true
//                queue.append((nextX, nextY))
//
//            case .nonNormal:
//                guard !nonNormalVisited[nextX][nextY],
//                      current == nextNode else {
//                    continue
//                }
//
//                nonNormalVisited[nextX][nextY] = true
//                queue.append((nextX, nextY))
//            }
//        }
//    }
//}
//
//
//// 모든 위치에 대해 DFS 실행
//for x in 0..<n {
//    for y in 0..<n {
//        // 적록색약인 사람이 아직 방문하지 않은 경우
//        if !nonNormalVisited[x][y] {
//            nonNormalCount += 1
//            dfs(x, y, .nonNormal)
//            bfs(x, y, .nonNormal)
//        }
//
//        // 적록색약이 아닌 사람이 아직 방문하지 않은 경우
//        if !normalVisited[x][y] {
//            normalCount += 1
//            dfs(x, y, .normal)
//            bfs(x, y, .normal)
//        }
//    }
//}
//
//// 결과 출력 (적록색약인 사람이 볼 수 있는 구역의 수, 적록색약이 아닌 사람이 볼 수 있는 구역의 수)
//print("\(nonNormalCount) \(normalCount)")

