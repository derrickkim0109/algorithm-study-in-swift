//
//  main.swift
//  RunningRace
//
//  Created by Derrick kim on 2023/04/10.
//

import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    let playerWordCount = players.filter { $0.count < 3 || $0.count > 10 }.count

    guard players.count >= 5,
          players.count <= 50000,
          playerWordCount == 0,
          callings.count >= 2,
          callings.count <= 1000_000 else {
        return []
    }

    var totalPlayers = players
    var playersRank: [String: Int] = [:]

    for (index, player) in players.enumerated() {
        playersRank[player] = index
    }

    for calling in callings {
        let currentRank = playersRank[calling]!
        let oneStepHighRankPlayer = totalPlayers[currentRank - 1]
        totalPlayers.swapAt(currentRank - 1, currentRank)

        playersRank[calling]! -= 1
        playersRank[oneStepHighRankPlayer]! += 1
    }

    let result = playersRank.sorted(by: { $0.value < $1.value }).map{ $0.key }
    return result
}

print(solution(
    ["mumu", "soe", "poe", "kai", "mine"],
    ["kai", "kai", "mine", "mine"]))
