//
//  main.swift
//  Dijkstra
//
//  Created by Derrick kim on 2/22/24.
//

import Foundation

//// 다익스트라 알고리즘 구현
//func dijkstra(start: Vertex, graph: [Vertex]) {
//    start.shortestPath = 0
//    var queue = graph
//
//    while !queue.isEmpty {
//        // shortestPath가 가장 작은 정점을 찾음
//        let current = queue.min(by: { $0.shortestPath < $1.shortestPath })!
//
//        // 현재 정점과 연결된 정점들을 확인하고 shortestPath 업데이트
//        for edge in current.edges {
//            let neighbor = edge.0
//            let weight = edge.1
//            let distance = current.shortestPath + weight
//            if distance < neighbor.shortestPath {
//                neighbor.shortestPath = distance
//            }
//        }
//
//        // 큐에서 현재 정점을 제거
//        if let index = queue.firstIndex(of: current) {
//            queue.remove(at: index)
//        }
//    }
//}

//// 예시 그래프 생성
//let A = Vertex(name: "A")
//let B = Vertex(name: "B")
//let C = Vertex(name: "C")
//let D = Vertex(name: "D")
//let E = Vertex(name: "E")
//
//A.edges = [(B, 6), (D, 1)]
//B.edges = [(A, 6), (C, 5), (D, 2), (E, 2)]
//C.edges = [(B, 5), (E, 5)]
//D.edges = [(A, 1), (B, 2), (E, 1)]
//E.edges = [(B, 2), (C, 5), (D, 1)]
//
//// 그래프 정점 배열
//let graph = [A, B, C, D, E]
//
//// 다익스트라 알고리즘 실행
//dijkstra(start: A, graph: graph)
//
//// 결과 출력
//for vertex in graph {
//    print("Shortest path from A to \(vertex.name): \(vertex.shortestPath)")
//}

//func dijkstra(graph: [[(Int, Int)]], start: Int, end: Int) -> Int {
//    let vertex = graph.count - 1
//    var distance = [Int](repeating: Int.max, count: vertex + 1)
//    distance[start] = 0
//    var pq = PriorityQueue<(Int, Int)>(sort: { $0.0 < $1.0 })
//    pq.enqueue((0, start))
//
//    while !pq.isEmpty {
//        let (dist, now) = pq.dequeue()!
//        if distance[now] < dist {
//            continue
//        }
//        for (next, weight) in graph[now] {
//            let cost = distance[now] + weight
//            if cost < distance[next] {
//                distance[next] = cost
//                pq.enqueue((cost, next))
//            }
//        }
//    }
//    return distance[end] // 시작 정점에서 목표 정점까지의 최단 거리 반환
//}

// 우선순위 큐 구현
//struct PriorityQueue<Element> {
//    private var elements: [Element] = []
//    private let sort: (Element, Element) -> Bool
//
//    init(sort: @escaping (Element, Element) -> Bool) {
//        self.sort = sort
//    }
//
//    var isEmpty: Bool {
//        return elements.isEmpty
//    }
//
//    mutating func enqueue(_ element: Element) {
//        elements.append(element)
//        elements.sort(by: sort)
//    }
//
//    mutating func dequeue() -> Element? {
//        return isEmpty ? nil : elements.removeFirst()
//    }
//}

// 예시 그래프
//let graph: [[(Int, Int)]] = [
//    [], // 0번째 인덱스는 사용하지 않음
//    [(2, 1), (3, 4), (4, 2)], // 정점 1에 연결된 정점들과 가중치
//    [(1, 1), (3, 2)], // 정점 2에 연결된 정점들과 가중치
//    [(1, 4), (2, 2), (4, 3)], // 정점 3에 연결된 정점들과 가중치
//    [(3, 3), (1, 2)] // 정점 4에 연결된 정점들과 가중치
//]
//
//// 다익스트라 알고리즘 실행
//let shortestDistance = dijkstra(graph: graph, start: 1, end: 4)
//print("Shortest distance:", shortestDistance) // 출력: 2

//문제
//방향성이 없는 그래프가 주어진다. 세준이는 1번 정점에서 N번 정점으로 최단 거리로 이동하려고 한다. 또한 세준이는 두 가지 조건을 만족하면서 이동하는 특정한 최단 경로를 구하고 싶은데, 그것은 바로 임의로 주어진 두 정점은 반드시 통과해야 한다는 것이다.
//
//세준이는 한번 이동했던 정점은 물론, 한번 이동했던 간선도 다시 이동할 수 있다. 하지만 반드시 최단 경로로 이동해야 한다는 사실에 주의하라. 1번 정점에서 N번 정점으로 이동할 때, 주어진 두 정점을 반드시 거치면서 최단 경로로 이동하는 프로그램을 작성하시오.
//
//입력
//첫째 줄에 정점의 개수 N과 간선의 개수 E가 주어진다. (2 ≤ N ≤ 800, 0 ≤ E ≤ 200,000) 둘째 줄부터 E개의 줄에 걸쳐서 세 개의 정수 a, b, c가 주어지는데, a번 정점에서 b번 정점까지 양방향 길이 존재하며, 그 거리가 c라는 뜻이다. (1 ≤ c ≤ 1,000) 다음 줄에는 반드시 거쳐야 하는 두 개의 서로 다른 정점 번호 v1과 v2가 주어진다. (v1 ≠ v2, v1 ≠ N, v2 ≠ 1) 임의의 두 정점 u와 v사이에는 간선이 최대 1개 존재한다.
//
//출력
//첫째 줄에 두 개의 정점을 지나는 최단 경로의 길이를 출력한다. 그러한 경로가 없을 때에는 -1을 출력한다.

// 간선 정보와 비교 가능하도록 구조체 정의
//struct EdgeData: Comparable {
//    let cost: Int // 간선의 비용
//    let node: Int // 도착 노드
//
//    // 두 간선을 비용 기준으로 비교
//    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
//        return lhs.cost < rhs.cost
//    }
//}
//
//// 다익스트라 알고리즘 구현
//func dijkstra(start: Int) -> [Int] {
//    var distance = Array(repeating: 999999999, count: N+1) // 모든 노드까지의 최단 거리를 무한대로 초기화
//    distance[start] = 0 // 시작 노드까지의 거리는 0
//
//    var heap = Heap<EdgeData>(sort: <) // 우선순위 큐(최소 힙) 초기화
//    heap.insert(EdgeData(cost: 0, node: start)) // 시작 노드를 큐에 삽입
//
//    // 큐가 빌 때까지 반복
//    while !heap.isEmpty {
//        let current = heap.remove() // 우선순위 큐에서 가장 비용이 작은 노드를 추출
//        let (currentNode, currentDistance) = (current!.node, current!.cost) // 현재 노드와 해당 노드까지의 거리
//
//        // 현재 노드까지의 거리가 이미 저장된 거리보다 크면 무시
//        if distance[currentNode] < currentDistance {
//            continue
//        }
//
//        // 현재 노드와 인접한 모든 노드에 대해 반복
//        for (nextNode, nextCost) in graph[currentNode] {
//            let nextDistance = currentDistance + nextCost // 다음 노드까지의 거리 계산
//
//            // 다음 노드까지의 거리가 현재 알려진 거리보다 작으면 갱신
//            if nextDistance < distance[nextNode] {
//                distance[nextNode] = nextDistance
//                heap.insert(EdgeData(cost: nextDistance, node: nextNode)) // 갱신된 거리로 우선순위 큐에 삽입
//            }
//        }
//    }
//    return distance // 모든 노드까지의 최단 거리 반환
//}
//
//// 입력 처리
//let NE = readLine()!.split(separator: " ").map{Int(String($0))!}
//let (N,E) = (NE[0],NE[1]) // 노드 수와 간선 수
//
//var graph = Array(repeating: [(Int,Int)](), count: N+1) // 그래프 초기화
//
//// 간선 정보 입력
//for _ in 0..<E {
//    let abc = readLine()!.split(separator: " ").map{Int(String($0))!}
//    let (a,b,c) = (abc[0],abc[1],abc[2])
//    graph[a].append((b,c)) // 양방향 그래프
//    graph[b].append((a,c))
//}
//
//// 특정 노드들 입력
//let v = readLine()!.split(separator: " ").map{Int(String($0))!}
//let (v1,v2) = (v[0],v[1])
//
//// 1번 노드에서 시작하여 v1, v2를 경유하는 두 가지 경로의 최단 거리 계산
//let dist1 = dijkstra(start: 1)
//let dist2 = dijkstra(start: v1)
//let dist3 = dijkstra(start: v2)
//
//// 두 경로 중 최소 거리 계산
//let first = dist1[v1] + dist2[v2] + dist3[N]
//let second = dist1[v2] + dist3[v1] + dist2[N]
//
//// 두 경로 중 최소값 출력, 경로가 없는 경우 -1 출력
//let ans = min(first,second)
//print(ans >= 999999999 ? -1 : ans)

//public struct Heap<T> {
//    private var nodes = [T]()
//    private var orderCriteria: (T, T) -> Bool
//
//    public init(sort: @escaping (T, T) -> Bool) {
//        self.orderCriteria = sort
//    }
//
//    public var count: Int {
//        return nodes.count
//    }
//
//    public var peek: T? {
//        return nodes.first
//    }
//
//    public var isEmpty: Bool {
//        return nodes.isEmpty
//    }
//
//    public mutating func insert(_ value: T) {
//        nodes.append(value)
//        shiftUp(nodes.count - 1)
//    }
//
//    public mutating func remove() -> T? {
//        guard !isEmpty else {
//            return nil
//        }
//
//        if count == 1 {
//            return nodes.removeLast()
//        } else {
//            let value = nodes[0]
//            nodes[0] = nodes.removeLast()
//            shiftDown(0)
//            return value
//        }
//    }
//
//    public mutating func remove(at index: Int) -> T? {
//        guard index < count else {
//            return nil
//        }
//
//        let lastIndex = count - 1
//
//        if index != lastIndex {
//            nodes.swapAt(index, lastIndex)
//            shiftDown(from: index, until: lastIndex)
//            shiftUp(index)
//        }
//
//        return nodes.removeLast()
//    }
//
//    private func parentIndex(of index: Int) -> Int {
//        return (index - 1) / 2
//    }
//
//    private func leftChildIndex(of index: Int) -> Int {
//        return 2*index + 1
//    }
//
//    private func rightChildIndex(of index: Int) -> Int {
//        return 2*index + 2
//    }
//
//    private mutating func shiftUp(_ index: Int) {
//        var childIndex = index
//        let childNode = nodes[childIndex]
//        var parentIndex = self.parentIndex(of: index)
//
//        while childIndex > 0 && orderCriteria(childNode, nodes[parentIndex]) {
//            nodes[childIndex] = nodes[parentIndex]
//            childIndex = parentIndex
//            parentIndex = self.parentIndex(of: childIndex)
//        }
//
//        nodes[childIndex] = childNode
//    }
//
//    private mutating func shiftDown(from index: Int, until endIndex: Int) {
//        let leftChildIndex = self.leftChildIndex(of: index)
//        let rightChildIndex = self.rightChildIndex(of: index)
//        var first = index
//
//        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
//            first = leftChildIndex
//        }
//
//        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
//            first = rightChildIndex
//        }
//
//        if first == index { 
//            return
//        }
//
//        nodes.swapAt(index, first)
//        shiftDown(from: first, until: endIndex)
//    }
//
//    private mutating func shiftDown(_ index: Int) {
//        shiftDown(from: index, until: count)
//    }
//}
//
//let n = Int(readLine()!)!
//var heap = Heap<Int>(sort: >)
//var answer = [Int]()
//
//for _ in 0..<n {
//    // 연산에 대한 정보 x를 입력받습니다.
//    let x = Int(readLine()!)!
//    if x == 0 {
//        // x가 0이면 배열에서 가장 큰 값을 출력하고 그 값을 배열에서 제거합니다.
//        // 배열이 비어 있으면 0을 출력합니다.
//        answer.append(heap.remove() ?? 0)
//    } else {
//        // x가 자연수라면 배열에 x를 넣습니다.
//        heap.insert(x)
//    }
//}
//
//for a in answer {
//    print(a)
//}


//let io = FileIO()
//let n = io.readInt()
//
//var result = ""
//for _ in 0..<n {
//    let k = io.readInt()
//    var dualHeap = DoubleHeap<Int>()
//
//    for _ in 0..<k {
//        if io.readString() == "I" {
//            dualHeap.insert(io.readInt())
//        } else {
//            if io.readInt() == 1 {
//                _ = dualHeap.maxPop()
//            } else {
//                _ = dualHeap.minPop()
//            }
//        }
//    }
//
//    if dualHeap.isEmpty() {
//        result += "EMPTY\n"
//    } else {
//        result += "\(dualHeap.maxFirst()!) \(dualHeap.minFirst()!)\n"
//    }
//}
//
//print(result)

//let n = Int(readLine()!)!
//
//var heap: Heap<Int> = Heap { a, b in
//    if abs(a) < abs(b) {
//        return true
//    } else if abs(a) == abs(b) {
//        return a < b
//    } else {
//        return false
//    }
//}
//
//var result = ""
//
//for _ in 0..<n {
//    let value = Int(readLine()!)!
//    if value != 0 {
//        heap.insert(value)
//    } else {
//        if let v = heap.remove() {
//            result += "\(v)\n"
//        } else {
//            result += "0\n"
//        }
//    }
//}
//
//print(result)

//// 입력을 받아 변수에 저장
//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let nodesCount = input[0] // 정점의 개수
//let edgesCount = input[1] // 간선의 개수
//var graph: [[Int]] = Array(repeating: [Int](), count: nodesCount + 1) // 인접 리스트
//var visited: [Bool] = Array(repeating: false, count: nodesCount + 1) // 방문 여부 체크
//var answer = 0 // 연결 요소의 개수
//
//// 간선 정보를 입력받아 양방향 그래프로 인접 리스트를 구성
//for _ in 0..<edgesCount {
//    let edge = readLine()!.split(separator: " ").map { Int($0)! }
//    let u = edge[0]
//    let v = edge[1]
//    graph[u].append(v)
//    graph[v].append(u)
//}
//
//// 너비 우선 탐색(BFS) 함수
//func bfs(_ startNode: Int) {
//    var queue = [startNode]
//    var index = 0
//    visited[startNode] = true
//
//    while queue.count > index {
//        let currentNode = queue[index]
//
//        for neighbor in graph[currentNode] {
//            if !visited[neighbor] {
//                visited[neighbor] = true
//                queue.append(neighbor)
//            }
//        }
//
//        index += 1
//    }
//}
//
//// 깊이 우선 탐색(DFS) 함수
//func dfs(_ currentNode: Int) {
//    visited[currentNode] = true
//
//    for neighbor in graph[currentNode] {
//        if !visited[neighbor] {
//            dfs(neighbor)
//        }
//    }
//}
//
//// 모든 노드를 순회하며 방문하지 않은 노드가 있으면 새로운 연결 요소 발견
//for i in 1...nodesCount {
//    if !visited[i] {
//        answer += 1
//        bfs(i) // BFS를 사용하여 연결 요소 탐색
//        // dfs(i) // 또는 DFS를 사용하여 연결 요소 탐색
//    }
//}
//
//print(answer)

//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let n = input[0] // 연구소의 세로 길이
//let m = input[1] // 연구소의 가로 길이
//
//// 연구소 지도 초기화
//var map = Array(repeating: Array(repeating: 0, count: m), count: n)
//
//// 이동 방향 (상하좌우)
//let dx = [-1, 1, 0, 0]
//let dy = [0, 0, -1, 1]
//
//// 최대 안전 영역 크기
//var answer = 0
//
//// 연구소 지도 입력 받기
//for i in 0..<n {
//    let value = readLine()!.split(separator: " ").map { Int($0)! }
//    map[i] = value
//}
//
//// DFS로 벽 세우기
//func dfs(_ wallCount: Int) {
//    // 벽을 3개 세웠다면 바이러스 퍼트리기 시작
//    if wallCount == 3 {
//        bfs()
//        return
//    }
//
//    // 모든 빈 칸에 대해 벽을 세우고 다음 dfs 호출
//    for i in 0..<n {
//        for j in 0..<m {
//            if map[i][j] == 0 {
//                map[i][j] = 1 // 벽 세우기
//                dfs(wallCount + 1) // 다음 벽 세우기
//                map[i][j] = 0 // 원상 복구
//            }
//        }
//    }
//}
//
//// BFS로 바이러스 퍼트리기
//func bfs() {
//    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
//    var tempMap = map // 바이러스 퍼짐 시뮬레이션을 위한 임시 지도
//    var queue = [[Int]]()
//
//    // 바이러스 위치 찾아서 큐에 추가
//    for i in 0..<n {
//        for j in 0..<m {
//            if tempMap[i][j] == 2 {
//                queue.append([i, j])
//            }
//        }
//    }
//
//    // BFS 실행
//    while !queue.isEmpty {
//        let current = queue.removeFirst()
//        let x = current[0]
//        let y = current[1]
//
//        for i in 0..<4 {
//            let nextX = x + dx[i]
//            let nextY = y + dy[i]
//
//            // 맵 범위 내이고, 방문하지 않았으며, 빈 칸일 경우
//            guard nextX >= 0,
//                nextX < n,
//               nextY >= 0,
//               nextY < m else {
//                continue
//            }
//
//            if !visited[nextX][nextY], tempMap[nextX][nextY] == 0 {
//                visited[nextX][nextY] = true
//                tempMap[nextX][nextY] = 2 // 바이러스 퍼짐
//                queue.append([nextX, nextY])
//            }
//        }
//    }
//
//    // 안전 영역 크기 계산
//    var count = 0
//    for i in 0..<n {
//        for j in 0..<m {
//            if tempMap[i][j] == 0 {
//                count += 1
//            }
//        }
//    }
//
//    // 최대 안전 영역 크기 업데이트
//    answer = max(answer, count)
//}
//
//dfs(0) // 벽 세우기 시작
//
//print(answer)

//struct City: Comparable {
//    let city: Int
//    let cost: Int
//
//    // 비용에 따른 비교 구현
//    static func < (lhs: City, rhs: City) -> Bool {
//        return lhs.cost < rhs.cost
//    }
//}
//
//// 입력 처리
//let n = Int(readLine()!)! // 도시의 개수
//let m = Int(readLine()!)! // 버스의 개수
//var city: [Int: [City]] = [:] // 도시 연결 정보 저장 딕셔너리
//
//// 버스 정보 입력 및 도시 딕셔너리 구성
//for _ in 0..<m {
//    let v = readLine()!.split(separator: " ").map { Int($0)! }
//    let start = v[0], destination = v[1], cost = v[2]
//    city[start, default: []].append(City(city: destination, cost: cost))
//}
//
//// 시작점과 도착점 입력
//var input = readLine()!.split(separator: " ").map { Int($0)! }
//let startCity = input[0], destinationCity = input[1]
//
//// 다익스트라 알고리즘 실행을 위한 초기 설정
//var costArray = Array(repeating: Int.max, count: n + 1) // 각 도시까지의 최소 비용 저장 배열
//var visited = Array(repeating: false, count: n + 1) // 방문 여부 표시 배열
//dijkstra(start: startCity, destination: destinationCity) // 다익스트라 알고리즘 실행
//
//// 최소 비용 출력
//print(costArray[destinationCity])
//
//// 다익스트라 알고리즘 구현 함수
//func dijkstra(start: Int, destination: Int) {
//    var queue = Heap<City>(sort: <) // 최소 힙을 이용한 우선순위 큐 구성
//    costArray[start] = 0 // 시작 도시까지의 비용은 0
//    queue.insert(City(city: start, cost: 0)) // 시작 도시 큐에 추가
//
//    while let currentCity = queue.remove() {
//        let current = currentCity.city
//
//        if visited[current] { continue } // 이미 방문한 도시는 건너뜀
//        visited[current] = true // 방문 표시
//
//        // 현재 도시에서 이동 가능한 모든 도시를 순회
//        for next in city[current] ?? [] {
//            let nextCity = next.city
//            if visited[nextCity] { continue } // 이미 방문한 도시는 건너뜀
//
//            // 새로운 경로가 기존 경로보다 비용이 적은 경우 업데이트
//            if costArray[nextCity] > costArray[current] + next.cost {
//                costArray[nextCity] = costArray[current] + next.cost
//                queue.insert(City(city: nextCity, cost: costArray[nextCity])) // 업데이트된 경로 큐에 추가
//            }
//        }
//    }
//}

//let n = Int(readLine()!)!
//var graph = Array(repeating: [Int](), count: n)
//var visited = Array(repeating: Array(repeating: false, count: n), count: n)
//var result = Array(repeating: Array(repeating: 0, count: n), count: n)
//
//for i in 0..<n {
//    let v = readLine()!.split(separator: " ").map { Int($0)! }
//    graph[i] = v
//}
//
//func dfs(start: Int, now: Int) {
//    for i in 0..<n {
//        if graph[now][i] == 1 && !visited[start][i] { // start에서 시작한 탐색으로, i를 방문하지 않았다면
//            result[start][i] = 1
//            visited[start][i] = true // start에서 i로의 경로를 방문했음을 표시
//            dfs(start: start, now: i) // i에서 다시 DFS 수행
//        }
//    }
//}
//
//// 각 시작점에 대한 DFS 탐색을 위한 반복문
//for i in 0..<n {
//    dfs(start: i, now: i)
//    visited = Array(repeating: Array(repeating: false, count: n), count: n) // 각 시작점마다 visited 초기화
//}
//
//for r in result {
//    for i in r {
//        print(i, terminator: " ")
//    }
//    print("")
//}

//struct City: Comparable {
//    var city: Int
//    var cost: Int
//
//    static func < (lhs: City, rhs: City) -> Bool {
//        return lhs.cost < rhs.cost
//    }
//}
//
//let n = Int(readLine()!)!
//let m = Int(readLine()!)!
//var cities: [Int: [City]] = [:]
//
//for i in 0..<m {
//    let info = readLine()!.split(separator: " ").map { Int($0)! }
//    let startCity = info[0]
//    let destinationCity = info[1]
//    let cost = info[2]
//
//    cities[startCity, default: []].append(City(city: destinationCity, cost: cost))
//}
//
//let destinationInfo = readLine()!.split(separator: " ").map { Int($0)! }
//let startCity = destinationInfo[0]
//let destinationCity = destinationInfo[1]
//
//var visited = Array(repeating: false, count: n + 1)
//var costArray = Array(repeating: Int.max, count: n + 1)
//var cityRoute = Array(repeating: -1, count: n + 1)
//
//dijkstra(start: startCity, destination: destinationCity)
//
//func dijkstra(start: Int, destination: Int) {
//    var heap = Heap<City>(sort: <)
//    costArray[start] = 0
//    cityRoute[start] = 0
//
//    heap.insert(City(city: start, cost: 0))
//
//    while let current = heap.remove() {
//        let currentCity = current.city
//
//        if visited[currentCity] {
//            continue
//        }
//
//        visited[currentCity] = true
//
//        for next in cities[currentCity] ?? [] {
//            let nextCity = next.city
//            let nextCost = next.cost
//
//            if costArray[currentCity] + nextCost < costArray[nextCity] {
//                costArray[nextCity] = costArray[currentCity] + nextCost
//                cityRoute[nextCity] = currentCity
//                heap.insert(City(city: nextCity, cost: costArray[nextCity]))
//            }
//        }
//    }
//}
//
//print(costArray[destinationCity])
//
//var route = destinationCity
//var answer: [Int] = []
//
//while cityRoute[route] != -1 {
//    answer.append(route)
//    route = cityRoute[route]
//}
//
//print(answer.count)
//print(answer.reversed().map { String($0) }.joined(separator: " "))

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var trueManList = readLine()!.split(separator: " ").map { Int($0)! }
var party = [[Int]]()
var graph = [[Int]](repeating: [], count: n+1)
var visited = [Bool](repeating: false, count: n+1)

for _ in 0..<m {
    let data = readLine()!.split(separator: " ").map { Int($0)! }
    let totalPeopleCount = data[0]
    let peopleSequence = Array(data[1...])

    party.append(peopleSequence)

    for i in 0..<totalPeopleCount {
        for j in i+1..<totalPeopleCount {
            let u = data[i+1], v = data[j+1]
            graph[u].append(v)
            graph[v].append(u)
        }
    }
}

func dfs(_ x: Int) {
    visited[x] = true
    for next in graph[x] where !visited[next] {
        dfs(next)
    }
}

// 진실을 알고 있는 사람들로부터 탐색 시작
for i in 1..<trueManList.count {
    dfs(trueManList[i])
}

// 진실을 모르는 사람만 있는 파티의 수 세기
let result = party.reduce(0) { count, p in
    let truthKnown = p.contains { visited[$0] }
    return count + (truthKnown ? 0 : 1)
}

print(result)
