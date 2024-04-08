//
//  main.swift
//  Tree
//
//  Created by Derrick kim on 2/21/24.
//

import Foundation

//// 배열로부터 트리 생성
//let rootNode = TreeNode(value: 8)
//
//rootNode.left = TreeNode(value: 3)
//rootNode.right = TreeNode(value: 10)
//
//rootNode.left?.left = TreeNode(value: 1)
//rootNode.left?.right = TreeNode(value: 6)
//rootNode.right?.right = TreeNode(value: 14)
//
//rootNode.left?.right?.left = TreeNode(value: 4)
//rootNode.left?.right?.right = TreeNode(value: 7)
//rootNode.right?.right?.left = TreeNode(value: 13)
//
//// TreeTraversal 객체 생성
//var treeTraversal = TreeTraversal()
//
//// In-order 순회 호출 및 결과 출력
//print("In-order 순회 결과:")
//treeTraversal.inOrderTraversal(rootNode)
//
//// Pre-order 순회 호출 및 결과 출력
//print("\nPre-order 순회 결과:")
//treeTraversal.preOrderTraversal(rootNode)
//
//// Post-order 순회 호출 및 결과 출력
//print("\nPost-order 순회 결과:")
//treeTraversal.postOrderTraversal(rootNode)
//
//// Level-order 순회 호출 및 결과 출력
//print("\nLevel-order 순회 결과:")
//treeTraversal.levelOrderTraversal(rootNode)

//final class BinarySearchTree<T: Comparable> {
//    var root: TreeNode<T>?
//
//    init() {
//        self.root = nil
//    }
//
//    func insert(_ value: T) {
//        self.root = insertHelper(root, value)
//    }
//
//    private func insertHelper(_ node: TreeNode<T>?, _ value: T) -> TreeNode<T> {
//        guard let node else {
//            return TreeNode<T>(value: value)
//        }
//
//        if value < node.value {
//            node.left = insertHelper(node.left, value)
//        } else {
//            node.right = insertHelper(node.right, value)
//        }
//
//        return node
//    }
//}
//
//var bst = BinarySearchTree<Int>()
//
//while let input = Int(readLine()!) {
//    bst.insert(input)
//}
//
//postOrderTraversal(bst.root)
//
//// Post-order 순회
//func postOrderTraversal(_ root: TreeNode<Int>?) {
//    guard let root = root else {
//        return
//    }
//
//    postOrderTraversal(root.left)
//    postOrderTraversal(root.right)
//    print(root.value)
//}

// 입력 처리
//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let N = input[0] // 행의 개수
//let M = input[1] // 열의 개수
//var graphs = Array(repeating: Array(repeating: 0, count: M), count: N)
//
//// 미로 정보 입력 받기
//for i in 0..<N {
//    let v = readLine()!.map { Int(String($0))! }
//    graphs[i] = v
//}
//
//// 방문 여부를 추적하는 배열 초기화
//var visited = Array(repeating: Array(repeating: false, count: M), count: N)
//// 최소 거리를 저장할 변수
//var min = Int.max
//
//func dfs(start: [Int], count: Int) {
//    // 시작점이 미로 범위를 벗어난 경우 종료
//    if start.first! < 0
//        || start.first! > graphs.count - 1
//        || start[1] < 0
//        || start[1] > graphs[0].count - 1 {
//        return
//    }
//
//    // 도착점에 도달한 경우 최소 거리 갱신
//    if start == [N - 1, M - 1] {
//        if min > count {
//            min = count
//        }
//
//        return
//    }
//
//    // 현재 위치를 방문 처리하고 주변 노드 탐색
//    if !visited[start.first!][start[1]],
//       graphs[start.first!][start[1]] == 1 {
//        visited[start.first!][start[1]] = true
//
//        // 상하좌우 탐색
//        dfs(start: [start.first! + 1, start[1]], count: count + 1)
//        dfs(start: [start.first! - 1, start[1]], count: count + 1)
//        dfs(start: [start.first!, start[1] + 1], count: count + 1)
//        dfs(start: [start.first!, start[1] - 1], count: count + 1)
//        visited[start.first!][start[1]] = false
//    }
//}
////dfs(start: [0, 0], count: 1)
////
////print(min)
//
//let dx = [0, 0, -1, 1]
//let dy = [-1, 1, 0, 0]
//var distance = Array(repeating: Array(repeating: 0, count: M), count: N)
//
//func bfs() {
//    distance[0][0] = 1
//    visited[0][0] = true
//
//    var queue: [[Int]] = [[0,0]]
//
//    while !queue.isEmpty {
//        let current = queue.removeFirst()
//
//        let x = current[0]
//        let y = current[1]
//
//        for i in 0..<4 {
//            let nextX = x + dx[i]
//            let nextY = y + dy[i]
//
//            guard nextX >= 0,
//               nextX < N,
//               nextY >= 0,
//               nextY < M else {
//                continue
//            }
//
//            if !visited[nextX][nextY],
//               graphs[nextX][nextY] == 1 {
//                distance[nextX][nextY] = distance[x][y] + 1
//                visited[nextX][nextY] = true
//                queue.append([nextX, nextY])
//            }
//        }
//    }
//}
//
//bfs()
//print(distance[N - 1][M-1])

//let n = Int(readLine()!)!
//// 그래프 초기화: n x n 크기의 2차원 배열
//var graphs: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
//// 방문 여부를 추적하는 2차원 배열
//var visited = Array(repeating: Array(repeating: false, count: n), count: n)
//// 상하좌우 이동을 위한 방향 벡터
//let dx = [0, 0, 1, -1]
//let dy = [1, -1, 0, 0]
//// 구역 내 요소의 개수를 세는 변수
//var count = 0
//
//// 그래프 입력 받기
//for i in 0..<n {
//    let v = readLine()!.map { Int(String($0))! }
//    graphs[i] = v
//}
//
//// DFS 함수 정의
//func dfs(_ x: Int,_ y: Int) {
//    count += 1 // 현재 구역의 요소 개수 증가
//    visited[x][y] = true // 현재 노드 방문 처리
//
//    // 상하좌우 탐색
//    for i in 0..<4 {
//        let nextX = x + dx[i]
//        let nextY = y + dy[i]
//
//        // 다음 위치가 그래프 범위 내에 있고 아직 방문하지 않았다면 탐색 진행
//        guard nextX >= 0,
//              nextX < n,
//              nextY >= 0,
//              nextY < n else {
//            continue
//        }
//
//        if !visited[nextX][nextY],
//            graphs[nextX][nextY] == 1 {
//
//            // 재귀적으로 다음 노드 탐색
//            dfs(nextX, nextY)
//        }
//    }
//}
//
//// 결과를 저장할 배열
//var result: [Int] = []
//
//// 모든 노드에 대해 DFS 탐색 시도
//for i in 0..<n {
//    for j in 0..<n {
//        // 현재 노드가 방문하지 않은 구역의 시작점이면 탐색 시작
//        if !visited[i][j] && graphs[i][j] == 1 {
//            count = 0 // 구역 내 요소 개수 초기화
//            dfs(i, j) // DFS 탐색 시작
//            result.append(count) // 탐색 완료 후 결과 배열에 추가
//        }
//    }
//}
//
//// 출력: 구역의 개수와 각 구역 내 요소의 개수
//print(result.count) // 구역의 총 개수 출력
//result.sort() // 구역 내 요소의 개수를 오름차순으로 정렬
//print(result.map{String($0)}.joined(separator: "\n"))

//// 테스트 케이스의 수를 입력받습니다.
//let t = Int(readLine()!)!
//
//for _ in 0..<t {
//    // 배추밭의 가로 길이 m, 세로 길이 n, 배추 위치 개수 k를 입력받습니다.
//    let mnk = readLine()!.split(separator: " ").map { Int($0)! }
//    let m = mnk[0] // 가로
//    let n = mnk[1] // 세로
//    let k = mnk[2] // 배추 위치 개수
//
//    // 상하좌우 이동을 위한 방향 배열입니다.
//    let dx = [0, 0, 1, -1] // 좌우
//    let dy = [1, -1, 0, 0] // 상하
//
//    // 배추밭을 나타내는 2차원 배열을 초기화합니다.
//    var graphs: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
//    // 방문한 위치를 기록하는 2차원 배열을 초기화합니다.
//    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
//
//    // 배추 위치 개수만큼 반복하여 배추 위치를 graphs 배열에 표시합니다.
//    for _ in 0..<k {
//        let distance = readLine()!.split(separator: " ").map { Int($0)! }
//        graphs[distance[1]][distance[0]] = 1
//    }
//
//    // DFS(깊이 우선 탐색) 함수 정의
//    func dfs(_ y: Int,_ x: Int) {
//        visited[y][x] = true // 현재 위치 방문 처리
//
//        // 상하좌우 네 방향에 대해 탐색
//        for i in 0..<4 {
//            let nextX = x + dx[i]
//            let nextY = y + dy[i]
//
//            // 탐색할 다음 위치가 배추밭 범위 내에 있고 아직 방문하지 않은 배추 위치인 경우
//            if nextX >= 0, nextX < m, nextY >= 0, nextY < n, !visited[nextY][nextX], graphs[nextY][nextX] == 1 {
//                dfs(nextY, nextX) // 재귀적으로 다음 위치 탐색
//            }
//        }
//    }
//
//    var count = 0 // 인접한 배추 그룹의 수를 세는 변수
//
//    // 배추밭 전체를 순회
//    for y in 0..<n {
//        for x in 0..<m {
//            // 방문하지 않은 배추 위치에서 탐색을 시작하여 그룹을 찾음
//            if !visited[y][x] && graphs[y][x] == 1 {
//                dfs(y, x) // DFS로 해당 그룹 탐색
//                count += 1 // 그룹 하나를 찾을 때마다 카운트 증가
//            }
//        }
//    }
//    // 필요한 배추흰지렁이의 최소 수(배추 그룹의 수)를 출력
//    print(count)
//}

// 1 익은 토마토, 0 익지 않은 토마토
// -1 토마토가 들어있지 않음
// 토마토 박스의 가로와 세로 크기를 입력받음
//let mn = readLine()!.split(separator: " ").map { Int($0)! }
//let m = mn[0] // 가로 x
//let n = mn[1] // 세로 y
//
//// 상하좌우 이동을 위한 방향 설정
//let dx = [1, -1, 0, 0]
//let dy = [0, 0, -1, 1]
//
//// 그래프 초기화 및 입력받기
//var graph = Array(repeating: Array(repeating: 0, count: m), count: n)
//var blankCount = 0 // 토마토가 들어있지 않은 칸의 수
//var result = 0 // 최종 결과(모든 토마토가 익는데 걸리는 시간)
//var tomatoCount = 0 // 익은 토마토의 수
//
//// 그래프 데이터 입력 받기 및 빈 칸(-1) 세기
//for i in 0..<n {
//    let v = readLine()!.split(separator: " ").map { Int($0)! }
//    graph[i] = v
//    blankCount += v.filter { $0 == -1 }.count
//}
//
//var queue: [[Int]] = [] // BFS를 위한 큐
//
//// 익은 토마토 위치 찾아 큐에 추가
//for i in 0..<n {
//    for j in 0..<m {
//        if graph[i][j] == 1 {
//            queue.append([i, j, 0]) // 위치 i, j와 날짜 0을 큐에 추가
//            tomatoCount += 1
//        }
//    }
//}
//
//// BFS 실행
//func bfs() {
//    var index = 0
//
//    while queue.count > index {
//        let current = queue[index]
//        let x = current[0]
//        let y = current[1]
//
//        // 상하좌우 탐색
//        for i in 0..<4 {
//            let nextX = x + dx[i]
//            let nextY = y + dy[i]
//            let nextDay = current[2] + 1 // 다음 날
//
//            // 범위 확인 후 익지 않은 토마토를 익히고 큐에 추가
//            if nextX >= 0,
//               nextX < n,
//               nextY >= 0,
//               nextY < m,
//               graph[nextX][nextY] == 0 {
//
//                graph[nextX][nextY] = 1
//                queue.append([nextX, nextY, nextDay])
//                tomatoCount += 1
//                result = nextDay // 마지막으로 토마토가 익은 날짜를 결과로 저장
//            }
//        }
//
//        index += 1
//    }
//}
//
//// BFS 실행
//bfs()
//
//// 모든 토마토가 익었다면 결과 출력, 그렇지 않으면 -1 출력
//if tomatoCount == (m * n) - blankCount {
//    print(result)
//} else {
//    print(-1)
//}

//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let n = input[0] // 수빈이 위치
//let k = input[1] // 동생 위치
//var visited = Array(repeating: false, count: 100_001)
//
//func bfs() {
//    var queue = [[n, 0]]
//    visited[n] = true
//    var index = 0
//
//    while index <= queue.count {
//        let currentPoint = queue[index]
//        let x = currentPoint[0]
//        let y = currentPoint[1]
//
//        if x == k {
//            print(y)
//            return
//        }
//
//        // -1, 1, *2
//        for i in 0..<3 {
//            var nextX = 0
//
//            switch i {
//            case 0:
//                nextX = x - 1
//            case 1:
//                nextX = x + 1
//            default:
//                nextX = x * 2
//            }
//
//            if nextX >= 0,
//               nextX <= 100_000,
//               !visited[nextX] {
//                visited[nextX] = true
//                queue.append([nextX, y + 1])
//            }
//        }
//
//        index += 1
//    }
//}
//
//bfs()

//
//func dp() -> Int {
//    var array = Array(repeating: 100_001, count: k+1)
//
//    if n >= k {
//        return n - k
//    }
//
//    for i in 0..<n {
//        array[i] = n - i
//    }
//
//    array[n] = 0
//
//    for i in n+1...k {
//        if i % 2 == 0 {
//            array[i] = min(array[i / 2] + 1, array[i - 1] + 1)
//        } else {
//            array[i] = min(array[i - 1] + 1, array[(i + 1) / 2] + 2)
//        }
//    }
//
//    return array[k]
//}
//
//print(dp())

// 입력을 받아서 변수에 저장
//let input = readLine()!.split(separator: " ").map { Int($0)! }
//
//// 2차원 배열의 크기 (2^n * 2^n)
//let n = Double(input[0])
//
//// 방문해야 하는 목표 위치
//let r = input[1] // 목표 행 위치
//let c = input[2] // 목표 열 위치
//var answer = 0 // 경로의 길이를 저장할 변수
//
//// 분할 정복을 이용한 DFS 함수
//func dfs(_ powN: Int, row: Int, column: Int) {
//    // 목표 위치에 도달한 경우, 현재까지의 경로 길이 출력 후 함수 종료
//    if row == r,
//       column == c {
//        print(answer)
//        return
//    }
//
//    // 현재 탐색 영역이 목표 위치를 포함하지 않는 경우
//    guard row <= r,
//          r < row + powN,
//          column <= c,
//          c < column + powN else {
//        // 해당 영역을 뛰어넘고, 경로 길이에 해당 영역의 크기만큼 더함
//        answer += powN * powN
//        return
//    }
//
//    // 현재 영역을 4분할하여 각 사분면에 대해 재귀적으로 함수 호출
//    // 1사분면
//    dfs(powN / 2, row: row, column: column)
//    // 2사분면
//    dfs(powN / 2, row: row, column: column + powN / 2)
//    // 3사분면
//    dfs(powN / 2, row: row + powN / 2, column: column)
//    // 4사분면
//    dfs(powN / 2, row: row + powN / 2, column: column + powN / 2)
//}
//
//// 초기 함수 호출, 전체 배열 크기와 시작 위치 (0, 0)를 인자로 넘김
//dfs(Int(pow(2.0, n)), row: 0, column: 0)

//// n: 그래프의 크기 (nxn)
//let n = Int(readLine()!)!
//
//// graph: 각 위치의 높이를 저장하는 2차원 배열
//var graph = Array(repeating: Array(repeating: 0, count: n), count: n)
//
//// visited: 각 위치를 방문했는지 여부를 저장하는 2차원 배열
//var visited: [[Bool]] = []
//
//// 이동 방향을 정의 (상, 하, 좌, 우)
//let dx = [-1, 1, 0, 0]
//let dy = [0, 0, -1, 1]
//
//// target: 그래프 내 최대 높이
//var target = 0
//
//// answer: 조건을 만족하는 구역의 최대 개수
//var answer = 0
//
//// 그래프의 높이 정보 입력 및 최대 높이 계산
//for x in 0..<n {
//    let v = readLine()!.split(separator: " ").map { Int(String($0))! }
//    graph[x] = v
//
//    for y in 0..<n {
//        target = max(target, graph[x][y])
//    }
//}
//
//// BFS 함수: 주어진 위치에서 시작하여 조건을 만족하는 모든 위치를 방문
//func bfs(_ x: Int, _ y: Int, _ target: Int) {
//    var queue: [(Int, Int)] = [(x, y)]
//    visited[x][y] = true
//
//    while !queue.isEmpty {
//        let (x, y) = queue.removeLast()
//
//        for i in 0..<4 {
//            let nextX = x + dx[i]
//            let nextY = y + dy[i]
//
//            if nextX >= 0, nextX < n, nextY >= 0, nextY < n, !visited[nextX][nextY], graph[nextX][nextY] > target {
//                visited[nextX][nextY] = true
//                queue.append((nextX, nextY))
//            }
//        }
//    }
//}
//
//// DFS 함수: 주어진 위치에서 시작하여 조건을 만족하는 모든 위치를 방문 (재귀적 방법)
//func dfs(_ x: Int, _ y: Int, _ target: Int) {
//    visited[x][y] = true
//
//    for i in 0..<4 {
//        let nextX = x + dx[i]
//        let nextY = y + dy[i]
//
//        if nextX >= 0, nextX < n, nextY >= 0, nextY < n, !visited[nextX][nextY], graph[nextX][nextY] > target {
//            dfs(nextX, nextY, target)
//        }
//    }
//}
//
//// 각 가능한 높이에 대해 조건을 만족하는 구역의 수를 계산
//for t in 0..<target {
//    visited = Array(repeating: Array(repeating: false, count: n), count: n)
//    var count = 0
//
//    for x in 0..<n {
//        for y in 0..<n {
//            if !visited[x][y], graph[x][y] > t {
//                bfs(x, y, t) // BFS 또는 DFS로 구역 탐색
//                // dfs(x, y, t) // 주석 처리된 DFS 호출
//                count += 1
//            }
//        }
//    }
//
//    answer = max(answer, count) // 최대 구역 수 업데이트
//}
//
//print(answer)

//final class TreeNode<T> {
//    var value: T
//    var left: TreeNode?
//    var right: TreeNode?
//
//    init(value: T) {
//        self.value = value
//    }
//}

//let n = Int(readLine()!)!
//var graph = Array(repeating: [Int](), count: n + 1)
//var parents = Array(repeating: -1, count: n + 1)
//
//for _ in 0..<n - 1 {
//    let input = readLine()!.split(separator: " ").map { Int($0)! }
//    let v1 = input[0]
//    let v2 = input[1]
//
//    graph[v1].append(v2)
//    graph[v2].append(v1)
//}
//
//func dfs(_ node: Int) {
//    for nextNode in graph[node] {
//        if parents[nextNode] == -1 {
//            parents[nextNode] = node
//            dfs(nextNode)
//        }
//    }
//}
//
//func bfs() {
//    var index = 0
//    var queue = [1, 0]
//
//    while queue.count > index {
//        let node = queue[index]
//
//        for nextNode in graph[node] {
//            if parents[nextNode] == -1 {
//                parents[nextNode] = node
//                queue.append(nextNode)
//            }
//        }
//
//        index += 1
//    }
//}
//
//bfs()
////dfs(1)
//
//print(parents[2...].map { String($0) }.joined(separator: "\n"))

//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let n = input[0]
//let m = input[1]
//
//var array = [Int]()
//var answer = ""
//
//func dfs(_ start: Int) {
//    if array.count == m,
//       array.sorted(by: { $0 < $1} ) == array {
//        answer += array.map { String($0) }.joined(separator: " ")
//        answer += "\n"
//        return
//    }
//
//    for i in start...n {
//        array.append(i)
//        dfs(i)
//        array.removeLast()
//    }
//}
//
//dfs(1)
//print(answer)

//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let a = input[0]
//let b = input[1]
//let c = input[2]
//
//func dfs(_ a: Int, _ b: Int, _ c: Int) -> Int {
//    if b == 1 {
//        return a
//    }
//
//    if b % 2 != 0 {
//        return a * dfs(a, b - 1, c)
//    }
//
//    let halfValue = dfs(a, b / 2, c) % c
//
//    return halfValue * halfValue % c
//}
//
//print(dfs(a, b, c) % c)

//final class TreeNode<T> {
//    var value: T
//    var left: TreeNode?
//    var right: TreeNode?
//
//    init(value: T) {
//        self.value = value
//    }
//}
//
//var tree = [String : TreeNode<String>]()
//
//// 예제 입력 데이터
//let n = Int(readLine()!)!
//
//for _ in 0..<n {
//    let v = readLine()!.split(separator: " ").map { String($0) }
//    let rootValue = v[0]
//    let leftValue = v[1]
//    let rightValue = v[2]
//
//    if tree[rootValue] == nil {
//        tree[rootValue] = TreeNode(value: rootValue)
//    }
//    let node = tree[rootValue]!
//
//    if leftValue != "." {
//        let leftNode = TreeNode(value: leftValue)
//        node.left = leftNode
//        tree[leftValue] = leftNode
//    }
//
//    if rightValue != "." {
//        let rightNode = TreeNode(value: rightValue)
//        node.right = rightNode
//        tree[rightValue] = rightNode
//    }
//}
//
//// 전위 순회
//func preOrderTraversal(_ node: TreeNode<String>?) {
//    guard let node = node else {
//        return
//    }
//    print(node.value, terminator: "")
//    preOrderTraversal(node.left)
//    preOrderTraversal(node.right)
//}
//
//// 중위 순회
//func inOrderTraversal(_ node: TreeNode<String>?) {
//    guard let node = node else {
//        return
//    }
//    inOrderTraversal(node.left)
//    print(node.value, terminator: "")
//    inOrderTraversal(node.right)
//}
//
//// 후위 순회
//func postOrderTraversal(_ node: TreeNode<String>?) {
//    guard let node = node else {
//        return
//    }
//    postOrderTraversal(node.left)
//    postOrderTraversal(node.right)
//    print(node.value, terminator: "")
//}
//
//let root = tree["A"]
//
//preOrderTraversal(root)
//print()
//inOrderTraversal(root)
//print()
//postOrderTraversal(root)
//print()

// 중위: a+b
// 전위: +ab
// 후위: ab+


//let input = readLine()!
//var stack = ""
//
//for char in input {
//    if char == "(" {
//        stack.append(char)
//    } else if char == ")" {
//        while !stack.isEmpty && stack.last != "(" {
//            print(stack.removeLast(), terminator: "")
//        }
//
//        stack.removeLast()
//    } else if (char == "*" || char == "/") {
//        while !stack.isEmpty && (stack.last == "*" || stack.last == "/") {
//            print(stack.removeLast(), terminator: "")
//
//        }
//
//        stack.append(char)
//    } else if (char == "+" || char == "-") {
//        while !stack.isEmpty && stack.last != "(" {
//            print(stack.removeLast(), terminator: "")
//        }
//
//        stack.append(char)
//    } else {
//        print(char,terminator: "")
//    }
//}
//
//while !stack.isEmpty {
//    print(stack.removeLast(),terminator: "")
//}

//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let n = input[0]
//let m = input[1]
//var graph = Array(repeating: [Int](), count: n)
//var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 2), count: 1001), count: 1001)
//
//let dx = [-1, 1, 0, 0]
//let dy = [0, 0, -1, 1]
//
//var index = 0
//var result = -1
//
//for i in 0..<n {
//    let array = readLine()!.map { Int(String($0))! }
//
//    graph[i] = array
//}
//
//func bfs() {
//    var queue: [((x: Int, y: Int, depth: Int), brokenWall: Int)] = [((0,0,1), 1)]
//    visited[0][0][1] = true
//
//    while queue.count > index {
//        let current = queue[index]
//
//        let x = current.0.x
//        let y = current.0.y
//        let depth = current.0.depth
//        let brokenWall = current.brokenWall
//        
//        if x == n - 1 && y == m - 1 {
//            result = depth
//            break
//        }
//
//        for i in 0..<4 {
//            let nextX = x + dx[i]
//            let nextY = y + dy[i]
//
//            guard nextX >= 0,
//                  nextX < n,
//                  nextY >= 0,
//                  nextY < m else {
//                continue
//            }
//
//            guard !visited[nextX][nextY][brokenWall] else {
//                continue
//            }
//
//            if graph[nextX][nextY] == 1 && brokenWall == 1 {
//                visited[nextX][nextY][brokenWall - 1] = true
//                queue.append(((nextX, nextY, depth + 1), brokenWall - 1))
//            } else if graph[nextX][nextY] == 0 {
//                visited[nextX][nextY][brokenWall] = true
//                queue.append(((nextX, nextY, depth + 1), brokenWall))
//            }
//        }
//        index += 1
//    }
//}
//
//bfs()
//print(result)

//let n = Int(readLine()!)!
//var graph = Array(repeating: [(childNode: Int, cost: Int)](), count: n + 1)
//
//for _ in 0..<n - 1 {
//    let input = readLine()!.split(separator: " ").map { Int($0)! }
//    let rootNode = input[0]
//    let childNode = input[1]
//    let cost = input[2]
//
//    graph[rootNode].append((childNode: childNode, cost: cost))
//    graph[childNode].append((childNode: rootNode, cost: cost))
//}
//
//func bfs(_ startNode: Int) -> (distance: Int, leaf: Int) {
//    var visited = Array(repeating: false, count: n + 1)
//    var maxDistance = 0
//    var maxLeaf = 0
//
//    visited[startNode] = true
//    var queue: [(node: Int, cost: Int)] = [(startNode, 0)]
//    var index = 0
//
//    while queue.count > index {
//        let (currentNode, currentDistance) = queue[index]
//
//        index += 1
//
//        if currentDistance >= maxDistance {
//            maxDistance = currentDistance
//            maxLeaf = currentNode
//        }
//
//        for (nextNode, nextDistance) in graph[currentNode] {
//            if !visited[nextNode] {
//                visited[nextNode] = true
//                queue.append((nextNode, currentDistance + nextDistance))
//            }
//        }
//    }
//    return (maxDistance, maxLeaf)
//}
//
//let maxLeaf = bfs(1).leaf
//
//print(bfs(maxLeaf).distance)

//let n = Int(readLine()!)!
//var myMax = readLine()!.split(separator: " ").map { Int($0)! }
//var myMin = myMax
//
//for _ in 1..<n {
//    let v = readLine()!.split(separator: " ").map { Int($0)! }
//
//    let maxValue = myMax
//    let minValue = myMin
//
//    myMax[0] = v[0] + max(maxValue[0], maxValue[1])
//    myMax[1] = v[1] + max(maxValue[0], max(maxValue[1], maxValue[2]))
//    myMax[2] = v[2] + max(maxValue[1], maxValue[2])
//
//    myMin[0] = v[0] + min(minValue[0], minValue[1])
//    myMin[1] = v[1] + min(minValue[0], min(minValue[1], minValue[2]))
//    myMin[2] = v[2] + min(minValue[1], minValue[2])
//}
//
//print(myMax.max()!, myMin.min()!)

let input = readLine()!.split(separator: " ").map { Int($0)! }
let r = input[0]
let c = input[1]

var board = Array(repeating: [Int](), count: r)

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
var result = 0

for i in 0..<r {
    let line = readLine()!.map { Int(String($0.asciiValue!))! - 65 }
    board[i] = line
}

func dfs(_ x: Int, _ y: Int, _ count: Int, _ bit: Int) {
    result = max(result, count)

    for i in 0..<4 {
        let nextX = x + dx[i]
        let nextY = y + dy[i]

        guard nextX >= 0,
              nextX < r,
              nextY >= 0,
              nextY < c else {
            continue
        }

        let nextBit = 1 << board[nextX][nextY]
        
        if bit & nextBit == 0 {
            dfs(nextX, nextY, count + 1, bit | nextBit)
        }
    }
}

dfs(0, 0, 1, 1 << board[0][0])

print(result)
