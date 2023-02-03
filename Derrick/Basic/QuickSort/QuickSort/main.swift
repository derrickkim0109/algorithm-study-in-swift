//
//  main.swift
//  QuickSort
//
//  Created by Derrick kim on 2022/12/27.
//

import Foundation

func quickSort(_ array: [Int]) -> [Int] {
    guard let first = array.first,
          array.count > 1 else { return array }
 
    let pivot: Int = first
    var left: [Int] = []
    var right: [Int] = []

    // O(2n)
//    let left: [Int] = array.filter { $0 < pivot }
//    let right: [Int] = array.filter { $0 > pivot }

    // O(N)
    for num in array {
        if num < pivot {
            left.append(num)
        }
    }

    for num in array {
        if num > pivot {
            right.append(num)
        }
    }

    return quickSort(left) + [pivot] + quickSort(right)
}

print(quickSort([5,2,3,1,6,2]))
