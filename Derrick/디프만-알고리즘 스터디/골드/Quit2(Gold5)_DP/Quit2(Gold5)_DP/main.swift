//
//  main.swift
//  Quit2(Gold5)_DP
//
//  Created by Derrick kim on 2023/05/12.
//

import Foundation

let quitDay = Int(readLine()!)!

var dp: [Int] = [0] + Array(repeating: 0, count: quitDay) + [0] // 0일 제외, N개 + 1개(마지막날의 T값이 1일 땐 근무 가능. -> 그 값을 저장하기 위해 배열 1 증가시킴.)

var maxValue = 0

for day in 1...quitDay {
    let tp = readLine()!.split(separator: " ").map { Int(String($0))! }
    let requiredDay = tp[0]
    let price = tp[1]

    let next = day + requiredDay
    maxValue = max(maxValue, dp[day])
    -0
    if next <= quitDay + 1 {
        dp[next] = max(dp[next], maxValue + price)
    }
}

print(dp.max()!)
print(dp)

// 1일, 5일
// 1  2  3  4  5  6  7
// 3  0  0  1  2  0  0
// 10 0  0  20 15 0  0
// 45

// 2일
// 1  2  3  4  5  6  7
// 0  5  0  0  0  0  0
// 0  20 0  0  0  0  0
// 20

// 3일
// 1  2  3  4  5  6  7
// 0  0  1  1  2  0  0
// 0  0  10 20 15  0  0
// 45

// 4일
// 1  2  3  4  5  6  7
// 0  0  0  1  2  0  0
// 0  0  0  20 15  0  0
// 35


// 5일
// 1  2  3  4  5  6  7
// 0  0  0  0  2  0  0
// 0  0  0  0  15  0  0
// 15
