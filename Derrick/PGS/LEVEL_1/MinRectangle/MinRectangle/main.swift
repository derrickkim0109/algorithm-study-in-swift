//
//  main.swift
//  MinRectangle
//
//  Created by Derrick kim on 2023/09/01.
//

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var maxNumber = 0
    var minNumber = 0

    for size in sizes {
        maxNumber = max(maxNumber, size.max() ?? 0)
        minNumber = max(minNumber, size.min() ?? 0)
    }


    return maxNumber * minNumber
}

print(solution([[60, 50], [30, 70], [60, 30], [80, 40]]))   // 4000
print(solution([[10, 7], [12, 3], [8, 15], [14, 7], [5, 15]])) //    120
print(solution([[14, 4], [19, 6], [6, 16], [18, 7], [7, 11]]))
