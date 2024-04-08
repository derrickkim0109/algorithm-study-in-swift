//
//  main.swift
//  CorrectBracket
//
//  Created by Derrick kim on 2023/04/12.
//

import Foundation

func solution(_ s:String) -> Bool
{
    var stack: [Character] = []

    for str in s {
        if str == "(" {
            stack.append(str)
        } else {
            guard !stack.isEmpty else {
                return false
            }
            stack.removeLast()
        }
    }

    return stack.isEmpty
}

func solution1(_ s: String) -> Bool {
    var answer: Bool = false
    var validationCount = 0

    for char in s {
        if validationCount < 0 {
            answer = false
            break
        }

        switch char {
        case "(":
            validationCount += 1
        case ")":
            validationCount -= 1
        default:
            break
        }
    }

    if validationCount == 0 {
        answer = true
    }

    return answer
}

print(solution("(())()"))
