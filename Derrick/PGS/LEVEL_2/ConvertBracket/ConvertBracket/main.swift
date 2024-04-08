//
//  main.swift
//  ConvertBracket
//
//  Created by Derrick kim on 2023/04/12.
//

import Foundation

func solution(_ p:String) -> String {
    if p.count < 1 {
        return ""
    }

    var count = 0
    var currentIndex = p.startIndex

    repeat{
        count += String(p[currentIndex]) == "(" ? 1 : -1
        currentIndex = p.index(after: currentIndex)
    } while count != 0

    var u = String(p[..<currentIndex])
    let w = String(p[currentIndex...])

    if String(u.first!) == "("{
        return u + solution(w)
    }else{
        u.removeLast()
        u.removeFirst()
        return "(\(solution(w)))\(u.map{String($0) == "(" ? ")" : "("}.joined())"
    }
}

print(solution("(()())()"))
print(solution("()))((()"))
print(solution(")("))
