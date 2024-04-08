//
//  main.swift
//  MemoryScore
//
//  Created by Derrick kim on 2023/04/12.
//

import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var result: [Int] = []
    var dic: [String: Int] = [:]

    for index in 0..<name.count {
        dic[name[index]] = yearning[index]
    }

    for photoMemory in photo {
        var sum = 0
        for userName in photoMemory {
            if let score = dic[userName] {
                sum += score
            }
        }
        result.append(sum)
    }

    return result
}

func solution1(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    let score: [String: Int] = Dictionary(uniqueKeysWithValues: zip(name, yearning))

    print(score)
    return photo.map { $0.reduce(0) {
        $0 + (score[$1] ?? 0)
    }}
}


//print(solution(["may", "kein", "kain", "radi"], [5, 10, 1, 3], [["may", "kein", "kain", "radi"],["may", "kein", "brin", "deny"], ["kon", "kain", "may", "coni"]]))

print(solution1(["may", "kein", "kain", "radi"], [5, 10, 1, 3], [["may", "kein", "kain", "radi"],["may", "kein", "brin", "deny"], ["kon", "kain", "may", "coni"]]))
