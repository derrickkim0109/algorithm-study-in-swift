//
//  main.swift
//  Coin1
//
//  Created by Derrick kim on 2023/05/10.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0]
let k = input[1]

var coins: [Int] = Array(repeating: 0, count: 101)
var dp: [Int] = Array(repeating: 0, count: 10001)

for index in 1...n {
    let value = Int(readLine()!)!
    coins[index] = value
}

dp[0] = 1

for i in 1...n {
    for j in coins[i]...k {
        dp[j] += dp[j - coins[i]]
    }
}

print(dp[k])

/**
    1    2     3     4     5     6     7     8     9     10
  1  1     1     1     1     1.    1.     1.   1     1.     1
  2  0     1.   1.    2.    2       3.     3.    4.    4.    5
  5. 0.    0     0     0      1     1      2.    2.    3.    4
    1   2    2      3      4    5      6      7.    8.    10

 1원으로 각 숫자를 1가지 방법으로 밖에 못 나타낸다

 2원에서 3원을 만들려면 1원 동전 1개와 2원짜리 동전하나가 든다.
 4원은 4에서 2원을 빼면 2원인데 2원의 경우에 수는 1만큼 올라간다

 5원에서 7원을 구하는 건 5를 빼면 2원이 남으니까 2원에 대한 경우의 수를 더한다.
 */

// 2차원 배열은 메모리 문제가 있어 1차원 배열로 풀어야 한다.
