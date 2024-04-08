//
//  main.swift
//  GymWear
//
//  Created by Derrick kim on 2023/02/02.
///Users/derrickkim/Documents/GitHub.nosync/algorithm-study-in-swift/Derrick/PGS/LEVEL_1/GymWear/GymWear

import Foundation
//학생들의 번호는 체격 순으로 매겨져 있어, 바로 앞번호의 학생이나 바로 뒷번호의 학생에게만 체육복을 빌려줄 수 있습니다.
//전체 학생의 수는 2명 이상 30명 이하입니다.
//체육복을 도난당한 학생의 수는 1명 이상 n명 이하이고 중복되는 번호는 없습니다.
//여벌의 체육복을 가져온 학생의 수는 1명 이상 n명 이하이고 중복되는 번호는 없습니다.
//여벌 체육복이 있는 학생만 다른 학생에게 체육복을 빌려줄 수 있습니다.
//여벌 체육복을 가져온 학생이 체육복을 도난당했을 수 있습니다. 이때 이 학생은 체육복을 하나만 도난당했다고 가정하며, 남은 체육복이 하나이기에 다른 학생에게는 체육복을 빌려줄 수 없습니다.

//func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
//    // 가지고 있는 체육복 개수 저장 (기본적으로 1벌)
//    var students: [Int] = Array(repeating: 1, count: n)
//
//    for lostIndex in lost {
//        students[lostIndex - 1] = 0
//    }
//
//    // 여벌 가져 온 사람은 +1 벌
//    for reserveIndex in reserve {
//        students[reserveIndex - 1] += 1
//    }
//
//    var count = 0 // 체육복을 빌리지 못한 학생 수
//    for studentSequence in 0..<n {
//        guard students[studentSequence] == 0 else { continue }
//
//        if studentSequence > 0
//            && students[studentSequence - 1] > 1 {
//            // 앞번호 학생에게 빌린다.
//            students[studentSequence] = 1
//            students[studentSequence - 1] = 1
//        } else if studentSequence < n - 1
//                    && students[studentSequence + 1] > 1 {
//            // 뒷번호 학생에게 빌린다.
//            students[studentSequence] = 1
//            students[studentSequence + 1] = 1
//        } else {
//            // 빌리지 못했다.
//            count += 1
//        }
//    }
//
//    return n - count
//}

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var students = Array(repeating: 1, count: n)

    for lostedStudentIndex in lost {
        students[lostedStudentIndex - 1] = 0
    }

    for reservableStudent in reserve {
        students[reservableStudent - 1] += 1
    }

    var unAvailableStudentCount = 0

    for index in 0..<n {
        guard students[index] == 0 else {
            continue
        }

        // 앞 사람에게 빌리기
        if index > 0 && students[index - 1] > 1 {
            students[index - 1] -= 1
            students[index] += 1
        } else if index < n - 1 && students[index + 1] > 1 {
            students[index + 1] -= 1
            students[index] += 1
        } else {
            unAvailableStudentCount += 1
        }
    }

    return n - unAvailableStudentCount
}

print(solution(5, [2, 4], [1, 3, 5]))
print(solution(5, [2, 4], [3]))
