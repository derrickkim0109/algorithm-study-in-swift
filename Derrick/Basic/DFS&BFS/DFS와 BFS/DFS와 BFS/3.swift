//
//  3.swift
//  DFS와 BFS
//
//  Created by Derrick kim on 2/26/24.
//

import Foundation

// O(n^2)

//func solution(_ weights: [Int]) -> Int {
//    var totalForce = 0
//    var currentForceArray = [Int]()
//
//    for weight in weights {
//        var neededForce = weight / 2
//        var neededForceArray = [Int]()
//
//        while neededForce != 0 {
//            let closestForce = makeClosestForce(neededForce)
//            neededForceArray.append(closestForce)
//            neededForce -= closestForce
//        }
//
//        if currentForceArray.isEmpty {
//            currentForceArray.append(contentsOf: neededForceArray)
//            print("minForce: ", currentForceArray.reduce(0, +))
//            totalForce += currentForceArray.reduce(0, +) * 2
//        } else {
//            var minForce = 0
//
//            while currentForceArray != neededForceArray {
//                var previous = 0
//
//                if currentForceArray.first != neededForceArray.first {
//                    previous = currentForceArray.reduce(0, +) + currentForceArray.filter { neededForceArray.contains($0) }.reduce(0, +)
//                } else {
//                    previous = currentForceArray.filter { !neededForceArray.contains($0) }.reduce(0, +)
//                }
//
//                let next = neededForceArray.filter { !currentForceArray.contains($0) }.reduce(0, +)
//                print("minForce: ", previous + next)
//                minForce += previous + next
//                currentForceArray = neededForceArray
//            }
//
//            totalForce += minForce * 2
//        }
//    }
//
//    return totalForce
//}

//func makeClosestForce(_ weight: Int) -> Int {
//    var powerOfTwo = 1
//    while powerOfTwo * 2 <= weight {
//        powerOfTwo *= 2
//    }
//    return powerOfTwo
//}
//
//// 예시 입력
//let weights = [18, 24, 22, 48]
//print(solution(weights)) // 출력: 112
//print(solution([14,8,8,30,1024])) // 출력: 1112
//print(solution([6, 12, 12])) // 출력: 24

// 새로 구한 로직
// O(m * (log k + n))
func solution(_ weights: [Int]) -> Int {
    var totalForce = 0
    var currentWeights = [Int: Int]() // key: 무게추, value: 개수

    for weight in weights {
        let target = weight / 2
        var neededWeights = [Int: Int]()

        // 필요한 무게추 계산
        var remaining = target
        while remaining > 0 {
            let power = makeClosestForce(remaining)
            neededWeights[power, default: 0] += 1
            remaining -= power
        }

        var force = 0

        let currentMax = currentWeights.keys.max() ?? 0
        let neededMax = neededWeights.keys.max() ?? 0

        // 현재 무게추와 필요한 무게추 비교하여 필요한 힘 계산
        for (weight, neededCount) in neededWeights {
            let currentCount = currentWeights[weight] ?? 0

            if neededCount > currentCount || (neededCount == currentCount && neededMax > currentMax) {
                force += weight
            }
        }

        for (weight, currentCount) in currentWeights {
            let neededCount = neededWeights[weight] ?? 0
            if currentCount > neededCount || (neededCount == currentCount && neededMax > currentMax)  {
                force += weight
            }
        }

        // 필요한 변경 적용 후 총 힘 업데이트
        totalForce += force * 2 // 양쪽에 끼워야 하므로 2배
        currentWeights = neededWeights // 현재 무게추 상태 업데이트
    }

    return totalForce
}

func makeClosestForce(_ weight: Int) -> Int {
    var powerOfTwo = 1
    while powerOfTwo * 2 <= weight {
        powerOfTwo *= 2
    }
    return powerOfTwo
}

//// 예시 입력
//let weights = [18, 24, 22, 48]
//print(solution(weights)) // 출력: 112
//print(solution([14,8,8,30,1024])) // 출력: 1112
//print(solution([6, 12, 12])) // 출력: 24
