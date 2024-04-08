//
//  empty.swift
//  Greedy
//
//  Created by Derrick kim on 2/29/24.
//

import Foundation
//문제
//라면매니아 교준이네 집 주변에는 N개의 라면 공장이 있다. 각 공장은 1번부터 N번까지 차례대로 번호가 부여되어 있다. 교준이는 i번 공장에서 정확하게 Ai개의 라면을 구매하고자 한다(1 ≤ i ≤ N).
//
//교준이는 아래의 세 가지 방법으로 라면을 구매할 수 있다.
//
//i번 공장에서 라면을 하나 구매한다(1 ≤ i ≤ N). 이 경우 비용은 3원이 든다.
//i번 공장과 (i+1)번 공장에서 각각 라면을 하나씩 구매한다(1 ≤ i ≤ N-1). 이 경우 비용은 5원이 든다.
//i번 공장과 (i+1)번 공장, (i+2)번 공장에서 각각 라면을 하나씩 구매한다(1 ≤ i ≤ N-2). 이 경우 비용은 7원이 든다.
//최소의 비용으로 라면을 구매하고자 할 때, 교준이가 필요한 금액을 출력하는 프로그램을 작성하시오.
//
//입력
//첫 번째 줄에 라면 공장의 개수를 의미하는 자연수 N가 주어진다.
//
//두번째 줄에 N개의 정수 A1, ···, AN가 사이에 공백을 두고 주어진다.

class Empty {
    func solution() {
        let n = Int(readLine()!)!
        var array = Array(repeating: 0, count: 100_000)
        var buf = readLine()!.split(separator: " ").map { Int(String($0))! }

        for i in 0..<buf.count {
            array[i] = buf[i]
        }

        var answer = 0
        var cost = 0

        for i in 0..<n {
            if array[i+1] > array[i+2] {
                let cost = min(array[i], array[i+1] - array[i+2])
                answer += 5 * cost
                array[i] -= cost
                array[i+1] -= cost

                let cost2 = min(array[i], min(array[i+1], array[i+2]))
                answer += 7 * cost2
                array[i] -= cost2
                array[i+1] -= cost2
                array[i+2] -= cost2
            } else {
                let cost2 = min(array[i], min(array[i+1], array[i+2]))
                answer += 7 * cost2
                array[i] -= cost2
                array[i+1] -= cost2
                array[i+2] -= cost2

                let cost = min(array[i], array[i+1])
                answer += 5 * cost
                array[i] -= cost
                array[i+1] -= cost
            }

            answer += 3 * array[i]
        }
    }
}
