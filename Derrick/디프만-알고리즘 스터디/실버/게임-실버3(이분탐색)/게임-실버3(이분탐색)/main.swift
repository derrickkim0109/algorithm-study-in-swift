//
//  main.swift
//  게임-실버3(이분탐색)
//
//  Created by Derrick kim on 2023/04/18.
//

import Foundation

//let input = readLine()!.split(separator: " ").map { Int($0)! }
//
//let numberOfMatches = input[0]
//let numberOfWins = input[1]
//
//let z = numberOfWins * 100 / numberOfMatches
//
//func solution(wins: Int, matches: Int, _ target: Int) -> Int {
//    var low = 1
//    var high = matches
//    var result = -1
//
//    while low <= high {
//        let mid: Int = (low + high) / 2
//
//        let guessWins: Int = wins + mid
//        let guessMatches: Int = matches + mid
//        let guessZ: Int = guessWins * 100 / guessMatches
//
//        if guessZ != target {
//            high = mid - 1
//            result = mid
//        } else {
//            low = mid + 1
//        }
//    }
//
//    return result
//}
//
//print(solution(wins: numberOfWins, matches: numberOfMatches, z))
