//
//  practice.swift
//  Dynamic-Programming01
//
//  Created by Derrick kim on 2/29/24.
//

import Foundation

func practice(_ N: Int, _ number: Int) -> Int {
    var answer = -1
    var dp = [Set<Int>]()

    for i in 1..<9 {
        var allCase = Set<Int>()
        let checkNumber = Int(String(repeating: "\(N)", count: i))!

        allCase.insert(checkNumber)
        
        for j in 0..<i-1 {
            for op1 in dp[j] {
                for op2 in dp[i-j-2] {
                    allCase.insert(op1 + op2)
                    allCase.insert(op1 - op2)
                    allCase.insert(op1 * op2)

                    if op2 != 0 {
                        allCase.insert(op1 / op2)
                    }
                }
            }
        }

        if allCase.contains(number) {
            answer = i
            break
        }

        dp.append(allCase)
    }

    return answer
}

func dfsPractice(_ N: Int, _ number: Int, _ depth: Int, _ temp: Int, _ answer: inout Int) {
    if depth > 8 {
        return
    }

    if temp == number && (answer > depth || answer == -1) {
        answer = depth
    }

    var calc = 0

    for i in 0..<8 {
        calc = Int(String(repeating: "\(N)", count: i))!

        dfsPractice(N, number, depth + 1 + i, temp + calc, &answer)
        dfsPractice(N, number, depth + 1 + i, temp - calc, &answer)
        dfsPractice(N, number, depth + 1 + i, temp * calc, &answer)
        dfsPractice(N, number, depth + 1 + i, temp / calc, &answer)
    }
}
