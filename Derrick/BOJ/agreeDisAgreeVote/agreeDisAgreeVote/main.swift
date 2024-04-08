//
//  main.swift
//  agreeDisAgreeVote
//
//  Created by Derrick kim on 2023/03/14.
//

import Foundation

let studentAmount = Int(readLine()!)!

func solution(_ studentAmount: Int) {
    let types = ["APPROVED", "REJECTED", "INVALID"]

    if studentAmount < 1 || studentAmount > 100 {
        print(types[2])
        return
    }

    let votes = readLine()!.split(separator: " ").map{ Int(String($0)) }

    let agreedVote = votes.filter{ $0 == 1 }
    let disAgreedVote = votes.filter{ $0 == -1 }
    let invalidVote = votes.filter{ $0 == 0 }

    if Double(invalidVote.count) >= (Double(studentAmount) / 2) {
        print(types[2])
        return
    }

    if agreedVote.count > disAgreedVote.count {
        print(types[0])
    } else {
        print(types[1])
    }
}


solution(studentAmount)
