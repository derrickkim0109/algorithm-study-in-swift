//
//  main.swift
//  ShiftOperation
//
//  Created by Derrick kim on 2023/03/14.
//

import Foundation

let length = Int(readLine()!)!

func solution(_ length: Int) {
    // length = 4
    // L Shift - a1 a2 a3 a4 -> a4 = 0
    // R Shift - a4 a3 a2 a1 -> a1 = 0

    let sequence = readLine()!.split(separator: " ").map{ Int($0)! }
    let zeroAndOne = sequence.filter{ $0 != 0 || $0 != 1 }

    // 제한사항
    if length < 3
        || length > 300000
        || sequence.count <= 0
        || zeroAndOne.count != 0 {
        print("0")
        print("")
    }
//    1 0 1 1 에서
//    L -> 1 0 1 1 -> 0 1 1 0
//    R -> 0 1 1 0 -> 0 1 0 0
//    R -> 0 1 0 0 -> 0 0 0 0

}

solution(length)
