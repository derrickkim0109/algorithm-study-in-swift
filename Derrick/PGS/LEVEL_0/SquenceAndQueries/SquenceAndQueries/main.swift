//
//  main.swift
//  SquenceAndQueries
//
//  Created by Derrick kim on 12/24/23.
//

import Foundation

//func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
//    var answer = Array(repeating: Int.max, count: queries.count)
//
//    for j in 0..<queries.count {
//        for i in queries[j][0]...queries[j][1] {
//            if arr[i] > queries[j][2] {
//                answer[j] = min(answer[j], arr[i])
//            }
//        }
//
//        if answer[j] == Int.max {
//            answer[j] = -1
//        }
//    }
//
//    return answer
//}
//print(solution([0, 1, 2, 4, 3], [[0, 4, 2],[0, 3, 2],[0, 2, 2]]))
func solution(_ l:Int, _ r:Int) -> [Int] {
    var answer = [Int]()

    for num in l...r {
        let numberString = String(num).map { String($0) }

        if(num % 5 != 0) {
            continue
        }

        let otherNumbers = (1...9).map { $0 }.filter { $0 != 5 }.map { String($0) }
        var count = 0

        for char in numberString {
            if char == "0" || char == "5" {
                if !otherNumbers.contains(char) {
                    count += 1
                }
            }
        }

        if count == numberString.count {
            answer.append(num)
        }
    }

    if answer.isEmpty {
        answer.append(-1)
    }

    return answer
}

print(solution(5, 555))
