//
//  main.swift
//  SortColor
//
//  Created by Derrick kim on 2023/02/03.
//

import Foundation

func sortColor(_ num: [Int]) {
    var array = num
    var numberZeroIndex = 0
    var numberTwoIndex = num.count - 1
    var startIndex = 0

    while(startIndex <= numberTwoIndex) {
        if (array[startIndex] == 0) {
            array.swapAt(startIndex, numberZeroIndex)
            numberZeroIndex += 1
            startIndex += 1
        } else if (array[startIndex] == 2) {
            array.swapAt(startIndex, numberTwoIndex)
            numberTwoIndex -= 1
        } else {
            startIndex += 1
        }
    }
}
