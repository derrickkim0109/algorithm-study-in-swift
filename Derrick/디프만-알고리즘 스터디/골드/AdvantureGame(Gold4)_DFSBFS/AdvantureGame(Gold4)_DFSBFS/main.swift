//
//  main.swift
//  AdvantureGame(Gold4)_DFSBFS
//
//  Created by Derrick kim on 2023/04/28.
//

import Foundation

var n: Int = 0
var way: [[Int]] = []
var cost = Array(repeating: 0, count: 1001)
var sw = 0
var visited = Array(repeating: 0, count: 1001)

while true {
    n = Int(readLine()!)!

    if n == 0 {
        break
    }

    way = Array(repeating: [], count: n + 1)
    sw = 0

    for i in 1...n {
        var input = readLine()!.split(separator: " ").map { $0 }
        let info = input.removeFirst()
        var c = 0


    }
}

func DFS(now: Int, _money: Int) {
    var money = _money

    if sw == 1 {
        return 
    }

    // n번째 방 도착
    if now == n {
        sw = 1
        return
    }

    for i in 0..<way[now].count {
        let next = way[now][i]

        // L
        if visited[next] == 1 {
            continue
        } else {
            // T or E
            money += cost[next]
        }

        // 돈 부족해서 못가는 경우
        if money < 0 {
            return
        }

        visited[next] = 1
        DFS(now: next, _money: money)
        visited[next] = 0
    }
}
