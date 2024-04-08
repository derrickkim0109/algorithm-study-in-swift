//
//  main.swift
//  DynamicProgramming
//
//  Created by Derrick kim on 3/5/24.
//

import Foundation

// 문제
//다음 소스는 N번째 피보나치 수를 구하는 C++ 함수이다.
//
//int fibonacci(int n) {
//    if (n == 0) {
//        printf("0");
//        return 0;
//    } else if (n == 1) {
//        printf("1");
//        return 1;
//    } else {
//        return fibonacci(n‐1) + fibonacci(n‐2);
//    }
//}
//fibonacci(3)을 호출하면 다음과 같은 일이 일어난다.
//
//fibonacci(3)은 fibonacci(2)와 fibonacci(1) (첫 번째 호출)을 호출한다.
//fibonacci(2)는 fibonacci(1) (두 번째 호출)과 fibonacci(0)을 호출한다.
//두 번째 호출한 fibonacci(1)은 1을 출력하고 1을 리턴한다.
//fibonacci(0)은 0을 출력하고, 0을 리턴한다.
//fibonacci(2)는 fibonacci(1)과 fibonacci(0)의 결과를 얻고, 1을 리턴한다.
//첫 번째 호출한 fibonacci(1)은 1을 출력하고, 1을 리턴한다.
//fibonacci(3)은 fibonacci(2)와 fibonacci(1)의 결과를 얻고, 2를 리턴한다.
//1은 2번 출력되고, 0은 1번 출력된다. N이 주어졌을 때, fibonacci(N)을 호출했을 때, 0과 1이 각각 몇 번 출력되는지 구하는 프로그램을 작성하시오.
//
//입력

//// 0과 1이 출력되는 횟수를 저장할 배열 초기화
//var zeroCount = [Int](repeating: 0, count: 41)
//var oneCount = [Int](repeating: 0, count: 41)
//// 초기값 설정
//zeroCount[0] = 1 // 0이 출력되는 횟수
//oneCount[1] = 1 // 1이 출력되는 횟수
//
//// 테스트 케이스 개수 입력
//let t = Int(readLine()!)!
//var answer = [Int]()
//for _ in 0..<t {
//    // N 입력
//    let n = Int(readLine()!)!
//    answer.append(n)
//}
//
//// 2부터 40까지 각 숫자에 대해 0과 1의 출력 횟수 계산
//for i in 2...40 {
//    zeroCount[i] = zeroCount[i - 1] + zeroCount[i - 2]
//    oneCount[i] = oneCount[i - 1] + oneCount[i - 2]
//}
//
//for index in answer {
//    print("\(zeroCount[index]) \(oneCount[index])")
//}

// 1 -> 0 dp[1]
// 2 -> 1 dp[2]
// 3 -> 1 dp[3]
// 4 -> 2 (4/2, 2/2) dp[4]
// 5 -> 3 (5 - 1, 4/2, 2/2) dp[5] = dp[4] + 1
// 6 -> 4, 2 ([(6-1, 5-1, 4/2, 2/2), (6/2, 3/3), (6/3, 2/2)]) dp[6] = dp[5] + 1

//let n = Int(readLine()!)!
//var dp: [Int] = Array(repeating: 0, count: n + 1)
//
//dp[1] = 0
//dp[2] = 1
//dp[3] = 1
//
//for i in 4..<n+1 {
//    dp[i] = dp[i - 1] + 1
//
//    if i % 2 == 0 {
//        dp[i] = min(dp[i], dp[i / 2] + 1)
//    }
//
//    if i % 3 == 0 {
//        dp[i] = min(dp[i], dp[i / 3] + 1)
//    }
//}
//
//print(dp[n])

//let n = Int(readLine()!)!
//var dp = Array(repeating: 0, count: n + 1)
//
//func solution() -> Int {
//    dp[1] = 1
//
//    for i in 2...n {
//        dp[i] = dp[i - 1] + dp[i - 2]
//    }
//
//    return dp[n]
//}
//
//
//print(solution())

//let n = Int(readLine()!)!
//var dp = Array(repeating: Array(repeating: 0, count: 3), count: n + 1) // n 집에 대해 각각 R, G, B 비용을 저장할 DP 배열
//
//for i in 0..<n {
//    let colorPrice = readLine()!.split(separator: " ").map { Int(String($0))! }
//    dp[i + 1][0] = colorPrice[0] // Red
//    dp[i + 1][1] = colorPrice[1] // Green
//    dp[i + 1][2] = colorPrice[2] // Blue
//}
//
//for i in 2...n {
//    // 각 색깔을 선택했을 때의 최소 비용 계산
//    dp[i][0] += min(dp[i - 1][1], dp[i - 1][2]) // Red를 선택했을 때, 이전 집은 Green 또는 Blue
//    dp[i][1] += min(dp[i - 1][0], dp[i - 1][2]) // Green을 선택했을 때, 이전 집은 Red 또는 Blue
//    dp[i][2] += min(dp[i - 1][0], dp[i - 1][1]) // Blue를 선택했을 때, 이전 집은 Red 또는 Green
//}
//
//// 마지막 집에 대해 각 색깔별 최소 비용 중 가장 작은 값이 전체 최소 비용
//print(min(dp[n][0], dp[n][1], dp[n][2]))

//// 입력 받기: n은 집의 개수
//let n = Int(readLine()!)!
//// dp 배열 초기화: 각 집에 대해 R, G, B로 칠할 때의 최소 비용을 저장
//var dp = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)
//// 각 집의 칠하는 비용을 저장하는 배열
//var array = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)
//// 가능한 최대 비용 설정
//var max = 1000 * 1000 + 1
//// 최종 결과를 저장할 변수
//var result = max
//
//// 각 집의 색칠 비용 입력 받기
//for i in 1...n {
//    let colorPrice = readLine()!.split(separator: " ").map { Int(String($0))! }
//    array[i] = colorPrice
//}
//
//// 첫 번째 집의 색을 기준으로 설정하고 나머지 집들의 최소 비용 계산
//for k in 0..<3 {
//    let a = (k + 1) % 3
//    let b = (k + 2) % 3
//
//    // 첫 번째 집의 색을 k로 고정하고, 나머지 두 색의 비용을 최대로 설정하여 첫 번째 집의 색이 고정되었음을 나타냄
//    dp[1][k] = array[1][k]
//    dp[1][a] = max
//    dp[1][b] = max
//
//    // 2번째 집부터 마지막 집까지 최소 비용 계산
//    for i in 2...n {
//        dp[i][0] = array[i][0] + min(dp[i - 1][1], dp[i - 1][2])
//        dp[i][1] = array[i][1] + min(dp[i - 1][0], dp[i - 1][2])
//        dp[i][2] = array[i][2] + min(dp[i - 1][0], dp[i - 1][1])
//    }
//
//    // 첫 번째 집을 k로 칠했을 때, 마지막 집을 a, b 색으로 칠하는 경우 중 최소 비용을 결과에 반영
//    result = min(result, dp[n][a], dp[n][b])
//}
//
//// 최종 결과 출력
//print(result)


// 오름차순으로 정렬된 가장 긴 수열을 최장 증가 부분 수열이라 한다.
//
//let n = Int(readLine()!)!
//var array = readLine()!.split(separator: " ").map { Int(String($0))! }
//var dp = Array(repeating: 0, count: n + 1)
//
//for i in 0..<n {
//    dp[i + 1] = 1
//
//    for j in 0..<i+1 {
//        if array[i] > array[j] {
//            dp[i + 1] = max(dp[i + 1], dp[j + 1] + 1)
//        }
//    }
//}
//
//print(dp.max()!)
//
//let n = Int(readLine()!)!
//var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
//var lis = Array(repeating: 0, count: 1001)
//var j = 0
//var i = 1
//
//lis[0] = arr[0] // lis 배열의 맨 첫번째 값은 arr[0]으로 초기화
//
//// arr의 두번째부터 마지막까지 하나씩 lis와 비교하면서 넣어준다.
//while i < n {
//    // lis 배열의 맨 뒤의 값보다 arr[i]가 더 크면 그것을 lis 배열 맨 뒤에 넣어준다.
//    if lis[j] < arr[i] {
//        lis[j + 1] = arr[i]
//        j += 1
//    }
//    // arr[i]값이 더 작으면, arr[i]의 값이 lis 배열 중 어느 곳에 들어올지 이분탐색한다.
//    else {
//        let idx = binarySearch(0, j, arr[i]) // 0부터 j까지 탐색하면서 arr[i]가 들어갈 수 있는 위치를 찾아서 idx에 반환
//        lis[idx] = arr[i]
//    }
//    i += 1
//}
//
//print(j + 1)
//
//// LIS를 유지하기 위해 숫자가 들어갈 위치를 이분탐색으로 찾는 함수
//func binarySearch(_ left: Int, _ right: Int, _ target: Int) -> Int {
//    var left = left
//    var right = right
//    var mid: Int
//
//    while left < right {
//        mid = (left + right) / 2 // 중간값 설정
//
//        if lis[mid] < target {
//            left = mid + 1
//        } else {
//            right = mid
//        }
//    }
//    return right
//}

//let n = Int(readLine()!)!
//let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
//
//var increaseDP = Array(repeating: 1, count: n)
//var decreaseDP = Array(repeating: 1, count: n)
//
//// LIS 계산
//for i in 0..<n {
//    for j in 0..<i {
//        if arr[i] > arr[j] {
//            increaseDP[i] = max(increaseDP[i], increaseDP[j] + 1)
//        }
//    }
//}
//
//// LDS 계산 (배열을 뒤집어서 동일한 방식으로 계산)
//for i in stride(from: n - 1, through: 0, by: -1) {
//    for j in stride(from: n - 1, through: i, by: -1) {
//        if arr[i] > arr[j] {
//            decreaseDP[i] = max(decreaseDP[i], decreaseDP[j] + 1)
//        }
//    }
//}
//
//// 최대 바이토닉 수열 길이 계산
//let maxLength = (0..<n).map { increaseDP[$0] + decreaseDP[$0] - 1 }.max()!
//print(maxLength)

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//let n = input[0]
//let k = input[1]
//var dp = Array(repeating: 10001, count: 10001)
//var coin = [Int]()
//
//dp[0] = 0
//
//for i in 0..<n{
//    coin.append(Int(String(readLine()!))!)
//
//    for j in stride(from: coin[i], through: k, by: 1) {
//        dp[j] = min(dp[j], dp[j - coin[i]] + 1)
//    }
//}
//
//if dp[k] == 10001{
//    print(-1)
//} else {
//    print(dp[k])
//}

//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//let n = input[0]
//let k = input[1]
//var dp = Array(repeating: 0, count: 10001)
//
//var coin = [Int]()
//
//dp[0] = 1
//
//for i in 0..<n {
//    coin.append(Int(readLine()!)!)
//    for j in stride(from: coin[i], through: k, by: 1){
//        if dp[j] + dp[j - coin[i]] >= Int(pow(2.0, 31.0)) {
//            dp[j] = 0
//        } else {
//            dp[j] += dp[j - coin[i]]
//        }
//    }
//}
//
//print(dp[k])

//let n = Int(readLine()!)!
//let array = readLine()!.split(separator: " ").map { Int($0)! }
//var list = [Int]()
//var answer = 1
//
//list.append(array[0])
//
//array.forEach { i in
//    if i > list.last! {
//        list.append(i)
//        answer += 1
//    } else { // 이 경우에는 list순회
//        let position = binarySearch(list, i)
//        list[position] = i
//    }
//}
//
//print(answer)
//
//func binarySearch(_ arr: [Int], _ target: Int) -> Int {
//    var start: Int = 0
//    var end: Int = arr.count
//    var mid: Int = 0
//
//    while end - start > 0 {
//        mid = (start + end) / 2
//
//        if arr[mid] < target {
//            start = mid + 1
//        } else {
//            end = mid
//        }
//    }
//    return end
//}

//let n = Int(readLine()!)!
//
//func dp(_ n: Int) -> Int {
//    if n < 2 {
//        return n
//    }
//
//    return dp(n - 1) + dp(n - 2)
//}
//
//print(dp(n))
//

let n = Int(readLine()!)!
let matrix = [[1, 1], [1, 0]]

// 행렬 곱셈
func multiMatrix(_ matrix1: [[Int]], matrix2: [[Int]]) -> [[Int]] {
    var result = [[Int]](repeating: Array(repeating: 0, count: 2), count: 2)

    for i in 0..<2 {
        for j in 0..<2 {
            for k in 0..<2 {
                // c11 = (a11 * b11) + (a12 * b21)
                result[i][j] += matrix1[i][j] * matrix2[k][j] * 1_000_000_007
            }
        }
    }

    return result
}

// 분할정복
func power(_ a: [[Int]], _ b: [[Int) -> [[Int]] {
    if b == 1 {
        return a
    } else {

    }
}
