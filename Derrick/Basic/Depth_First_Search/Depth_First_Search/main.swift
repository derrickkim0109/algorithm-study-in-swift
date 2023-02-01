//
//  main.swift
//  Depth_First_Search
//
//  Created by Derrick kim on 2023/02/01.
//

import Foundation

let rawData = "0123"
let data = rawData.map { String($0) }
var visit = [Bool](repeating: false, count: data.count)

func dfs_comb(data: [String], curInd: Int, curCnt: Int, targetCnt: Int, answer: String) {
    if curCnt == targetCnt {
        print(answer)
    }

    for i in curInd..<data.count {
        if !visit[i] {
            visit[i] = true
            dfs_comb(data: data, curInd: i, curCnt: curCnt + 1, targetCnt: targetCnt, answer: answer + data[i])
            visit[i] = false
        }
    }
}


func dfs(data: [String], curInd: Int, curCnt: Int, targetCnt: Int, answer: String) {
    if curCnt == targetCnt {
        print(answer)
        return
    }

    for i in 0..<data.count {
        if !visit[i] {
            visit[i] = true
            dfs(data: data, curInd: i, curCnt: curCnt + 1, targetCnt: targetCnt, answer: answer + data[i])
            visit[i] = false
        }
    }
}

print(dfs_comb(data: data, curInd: 0, curCnt: 0, targetCnt: 2, answer: ""))

// 단순 dfs, bfs
// 1) dfs
//
// 1.방문
// 2.방문할 리스트 for
// 3.정해진곳 방문 후 1번으로 다시

func dfs(_ start: Int) {
    visit[start] = true // 1.방문
    print(start, terminator: " ")

    // 2. 방문할 리스트
    for end in 1...N {
        if map[start][end] == 1, !visit[end] {
            visit[end] = true
            dfs(end) // 3. 정해진곳 방문 후 1번으로 다시
        }
    }
}

//2) bfs
//
// 1.방문
// 2.근처 노드들을 Queue에 삽입
// 3.Queue에서 하나 빼낸 후 다시 1번부터 시작

// bfs주의사항 - removeFirst()안쓰고 idx 쓰기
func bfs() {
  var q = [Int]()
  var ans = ""
    var idx = 0
  q.append(s)
  var visited = [Bool](repeating: false, count: n+1)
  visited[s] = true

  while idx < q.count {
    idx += 1
    ans = ans + "\(next) "

    for val in arr[next] where !visited[val] {
      q.append(val)
      visited[val] = true
    }
  }

  print(ans)
}
