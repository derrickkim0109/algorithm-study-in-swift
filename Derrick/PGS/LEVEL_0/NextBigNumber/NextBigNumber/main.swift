//
//  main.swift
//  NextBigNumber
//
//  Created by Derrick kim on 2023/04/11.
//

import Foundation

func solution(_ n:Int) -> Int
{
    guard n >= 0, n <= 1000_000 else {
        return 0
    }

    var answer:Int = n

    let binaryCount = String(n, radix: 2).filter { $0 == "1" }.count

    while true {
        answer += 1
        let answerBinary = String(answer, radix: 2).filter { $0 == "1" }.count

        if answerBinary == binaryCount {
            return answer
        }
    }
}

print(solution(78))
print(solution(15))
