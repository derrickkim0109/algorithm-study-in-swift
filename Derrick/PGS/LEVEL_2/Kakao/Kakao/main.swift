//
//  main.swift
//  Kakao
//
//  Created by Derrick kim on 12/20/23.
//

import Foundation

func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
    let maxAlp = problems.map{$0[0]}.max()!
    let maxCop = problems.map{$0[1]}.max()!
    let alp = min(alp, maxAlp)
    let cop = min(cop, maxCop)
    let INF = 10000
    var dp = Array(repeating: Array(repeating: INF, count: maxCop + 1), count: maxAlp + 1)
    dp[alp][cop] = 0

    for algorithmPower in alp..<maxAlp+1 {
        for codingPower in cop..<maxCop+1 {
            var flag = false

            if algorithmPower + 1 <= maxAlp {
                dp[algorithmPower+1][codingPower] = min(dp[algorithmPower+1][codingPower], dp[algorithmPower][codingPower] + 1)
                flag = true
            }
            if codingPower + 1 <= maxCop {
                dp[algorithmPower][codingPower+1] = min(dp[algorithmPower][codingPower+1], dp[algorithmPower][codingPower] + 1)
                flag = true
            }

            if flag {
                for problem in problems {
                let (alp_req, cop_req, alp_rwd, cop_rwd, cost) = (problem[0], problem[1], problem[2], problem[3], problem[4])

                if algorithmPower >= alp_req && codingPower >= cop_req {
                    let totalAlp = min(maxAlp, algorithmPower + alp_rwd)
                    let totalCop = min(maxCop, codingPower + cop_rwd)
                    dp[totalAlp][totalCop] = min(dp[totalAlp][totalCop], dp[algorithmPower][codingPower] + cost)
                    }
                }
            }
        }
    }
    return dp[maxAlp][maxCop]
}

print(solution(10, 10, [[10,15,2,1,2],[20,20,3,3,4]]))
print(solution(0, 0, [[0, 0, 2, 1, 2], [4, 5, 3, 1, 2], [4, 11, 4, 0, 2], [10, 4, 0, 4, 2]]))
