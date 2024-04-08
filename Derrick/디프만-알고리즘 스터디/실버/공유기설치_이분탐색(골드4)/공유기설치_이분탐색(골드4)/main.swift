//
//  main.swift
//  공유기설치_이분탐색(골드4)
//
//  Created by Derrick kim on 2023/04/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let houseAmount = input[0]
let wifiAmount = input[1]
var housePoints = [Int]()

for _ in 0..<houseAmount {
    let xPoint = Int(readLine()!)!

    housePoints.append(xPoint)
}

housePoints.sort()

func solution(_ array: [Int], target: Int) -> Int {
    var lowX = 1
    var highX = array.last! - array.first!
    var result = 0

    while lowX <= highX {
        let mid = (lowX + highX) / 2
        var wifeCount = 1
        var installed = array[0]

        for index in 1..<array.count {
            let current = array[index]

            if current - installed >= mid {
                wifeCount += 1
                installed = current
            }
        }

        if wifeCount < target {
            highX = mid - 1
        } else {
            lowX = mid + 1
            result = mid
        }
    }

    return result
}

print(solution(housePoints, target: wifiAmount))
