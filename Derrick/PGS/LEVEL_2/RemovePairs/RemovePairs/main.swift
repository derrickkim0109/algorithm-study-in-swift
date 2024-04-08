//
//  main.swift
//  RemovePairs
//
//  Created by Derrick kim on 2023/04/12.
//

import Foundation

func solution(_ s:String) -> Int {
    let str = Array(s)
    var result: [Character] = []

    for i in 0..<s.count {
        if !result.isEmpty && result.last! == str[i] {
            result.removeLast()
        } else {
            result.append(str[i])
        }
    }

    return str.isEmpty ? 1 : 0
}

func solution1(_ s: String) -> Int {
    if s.count % 2 != 0 {
        return 0
    }

    var str = [Character]()

    for char in s {
        if str.last == char {
            str.removeLast()
        } else {
            str.append(char)
        }
    }

    if str.isEmpty {
        return 1 
    } else {
        return 0
    }
}

func solution2(_ s: String) -> Int {
    let str = Array(s)
    var stack: [Character] = []

    guard str.count % 2 == 0 else {
        return 0
    }

    for char in str {
        stack.append(char)

        while stack.count > 1, stack[stack.count - 1] == stack[stack.count - 2] {
            stack.removeLast()
            stack.removeLast()
        }
    }

    return stack.isEmpty ? 1 : 0
}

print(solution("baabaa"))
