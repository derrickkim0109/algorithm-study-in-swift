//
//  main.swift
//  coin_zero
//
//  Created by Derrick kim on 2022/11/17.
//

import Foundation

let coinTypesAmountAndTargetBudget = readLine()?.split(separator: " ").map{ Int($0)! }

let coinTypesAmount = coinTypesAmountAndTargetBudget![0]
var targetBudget = coinTypesAmountAndTargetBudget![1]

var coinType: [Int] = []

func solution(_ targetNum: Int) -> Int {
    while (targetBudget != 0) {
        var coinType = 0

        for type in sortedCoinTypes {
            if targetBudget >= type {
                coinType = type
                break
            }
        }

        let multi = (targetBudget / coinType)
        count += multi
        targetBudget -= (coinType * multi)
    }
    return count
}

for _ in 0..<coinTypesAmount {
    let type = Int(readLine()!)!
    coinType.append(type)
}

let sortedCoinTypes = coinType.sorted(by: { $0 > $1 })
var count = 0

print(solution(targetBudget))

//[10 ,4200]
//1,
//5,
//10,
//50,
//100,
//500,
//1000,
//5000,
//10000,
//50000
