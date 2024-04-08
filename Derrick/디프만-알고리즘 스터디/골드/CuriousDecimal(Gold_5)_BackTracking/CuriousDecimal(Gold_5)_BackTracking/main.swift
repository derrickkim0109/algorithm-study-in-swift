//
//  main.swift
//  CuriousDecimal(Gold_5)_BackTracking
//
//  Created by Derrick kim on 2023/05/17.
//

import Foundation

let N = Int(readLine()!)!

let units: [Int] = [2, 3, 5, 7]

func isPrime(number: Int) -> Bool {
    if number < 2 {
        return false
    }

    for i in 2...number {
        if number % i == 0 {
            return false
        }
    }

    return true
}

func solution(number: Int) {
    if String(number).count == N {
        print(number)
    } else {
        for i in 1...9 {
            let temp = number * 10 + i

            if isPrime(number: temp) == true {
                solution(number: temp)
            }
        }
    }
}

for i in 0..<units.count {
    solution(number: units[i])
}
