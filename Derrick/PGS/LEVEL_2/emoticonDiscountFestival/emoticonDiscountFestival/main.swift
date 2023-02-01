//
//  main.swift
//  emoticonDiscountFestival
//
//  Created by Derrick kim on 2023/02/01.
//

import Foundation
// 1. 이모티콘 플러스를 최대한 늘리는 것
// 2. 이모티콘 플러스 가입자가 같다면 이모티콘 구매 비용이 높을수록 좋다

// [풀이]
// 1. 탐색 문제
// 2. 탐색 시간 -> 어떻게 줄일 수 있을까?
// 1) 이분 탐색, dp, greedy 같은 알고리즘을 적용해서 시간을 줄이는 문제
// 2) 완전 탐색 -> 탐색 시간을 어떻게 해도 줄일 수 없는 경우 / 완전 탐색을 써도 될 때
// 3) 탐색 시간 계산
// 완전 탐색을 한다고 하면 시간이 얼마나 걸리지?
// -> 4 가지 할인율(10%, 20%, 30%, 40%)
// -> 이모티콘 종류 최대 7개
// 4의 7승 -> 2의 14승 (16000 정도)
// 16000 * 100(유저최대 길이) => 1,600,000 개
// -> 각 유저 별로 이모티콘 살지 안살지 결정해야 하기 때문에

// * 시간복잡도를 계산했을 때 연산 횟수가 1억회 이하면 사용가능한 알고리즘이라 판단한다.
// 4) itertools의 중복 순열을 계산하는 방법
// 본인이 직접 중복 순열을 구현하는 방법

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    func dfs(data: [String], currentIndex: Int, currentCount: Int, targetCount: Int, answer: String) {
        var visit = [Bool](repeating: false, count: data.count)

        if currentCount == targetCount {
            totalCase.append(answer)
            return
        }

        for i in 0..<data.count {
            if !visit[i] {
                visit[i] = true
                dfs(data: data,
                    currentIndex: i,
                    currentCount: currentCount + 1,
                    targetCount: targetCount,
                    answer: answer + "," +  data[i])
                visit[i] = false
            }
        }
    }

    let discountPercentCase = [10, 20, 30, 40]
    var totalCase: [String] = []
    dfs(data: discountPercentCase.map{ String($0) },
            currentIndex: 0,
            currentCount: 0,
            targetCount: emoticons.count ,
            answer: "")

    let discountedCases = totalCase.map{ $0.split(separator: ",").map{ Int($0)! } }

     var answer = [0, 0]

    for discountCase in discountedCases {
        var totalPay = 0
        var plusSubscribeCount = 0

        for user in users {
            let userRate = user[0]
            let subscribePrice = user[1]
            var payment = 0

            for (index, emoticonPrice) in emoticons.enumerated() {
                // 이모티콘의 할인률(discountCase[index]가 rate보다 크기 때문에 이모티콘을 산다)
                if discountCase[index] >= userRate {
                    payment += emoticonPrice * (100 - discountCase[index]) / 100
                }
            }

            // 이모티콘 구매를 모두 취소하고 플러스 가입
            if payment >= subscribePrice {
                plusSubscribeCount += 1
            } else {
                // 이모티콘 플러스에 가입하지 않는 경우
                totalPay += payment
            }
        }

        if plusSubscribeCount > answer[0] {
            answer[0] = plusSubscribeCount
            answer[1] = totalPay
        }
        // 플러스 가입자 수는 같으면서 매출은 증가한 경우
        else if (plusSubscribeCount == answer[0] && totalPay > answer[1]) {
            answer[1] = totalPay
        }
    }

    return answer
}

print(solution([[40, 10000], [25, 10000]],
               [7000, 9000]))

 print(solution([[40, 2900], [23, 10000], [11, 5200], [5, 5900], [40, 3100], [27, 9200], [32, 6900]],
               [1300, 1500, 1600, 4900]))
