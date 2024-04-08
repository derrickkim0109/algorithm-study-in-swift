//
//  main.swift
//  OrderDictionarySubString
//
//  Created by Derrick kim on 2023/04/11.
//

import Foundation

//func solution(_ s: String) -> String {
//    var stack: [Character] = []
//    for char in s {
//        while stack.last != nil && stack.last! < char {
//            stack.removeLast()
//        }
//
//        stack.append(char)
//    }
//
//    return String(stack)
//}
//
//
//print(solution("xyb"))
//print(solution("yxyc"))

func solution(_ balls:Int, _ share:Int) -> Int {
    var dp = Array(repeating: 0.0, count: 30)
    dp[0] = 1

    for i in 1..<30 {
        dp[i] = dp[i - 1] * Double(i)
    }

    return Int(dp[balls] / (dp[balls - share] * dp[share]))
}

print(solution(3, 2))
