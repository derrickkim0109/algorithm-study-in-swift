//
//  main.swift
//  BinarySearch
//
//  Created by Derrick kim on 2022/12/25.
//

import Foundation

import Foundation

let sampleArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

func binarySearch(_ array: [Int], _ num: Int) -> Int? {

    var start = 0
    var end = array.count - 1

    while start <= end { // 이게 false 가 되는 경우는 둘이 만나는, 그러니까 배열의 원소가 1개만 남는 경우.

        let mid = (start + end) / 2
        let value = array[mid]

        if value == num {
            return mid                // 값이 아닌 위치를 반환한다.
        } else if value > num {       // 내가 찾는 숫자보다 추측 값이 더 큰 경우 => 다음에는 더 작게 추측해야한다.
            end = mid - 1
        } else {                      // 숫자가 추측 값보다 더 큰 경우 => 다음에는 더 크게 추측해야한다.
            start = mid + 1
        }

    }

    return nil
}

func binarySearchPractice(_ array: [Int], requiredNumber: Int) -> Int {
    var low = 0
    var high = array.count - 1

    while low <= high {
        var mid = (low + high) / 2
        let guessValue = array[mid]

        if guessValue == requiredNumber {
            while mid > 0 && array[mid - 1] == guessValue {
                mid -= 1
            }

            return array.count - mid
        } else if guessValue > requiredNumber {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }

    return array.count - low
}

func binarySearchRecursive(_ arr: [Int], _ target: Int, _ low: Int, _ high: Int) -> Int {
    if (low > high) {
        return -1
    }

    let mid = (low + high) / 2;
    if (arr[mid] == target) {
        return mid
    }
    else if (arr[mid] > target) {
        return binarySearchRecursive(arr, target, low, mid-1)
    }
    else {
        return binarySearchRecursive(arr, target, mid+1, high)
    }
}

//print(binarySearch(sampleArray, 13)!) // Result : 12
//print(binarySearch(sampleArray, 16)) // Result : Nil
//
//print(binarySearchRecursive(sampleArray, 13, 0, sampleArray.count - 1)) // Result : 12
//print(binarySearchRecursive(sampleArray, 16, 0, sampleArray.count - 1)) // Result : -1

print(binarySearchPractice(sampleArray, requiredNumber: 13)) // Result : 3 13이랑 같거나 큰 수
//print(binarySearchPractice(sampleArray, requiredNumber: 16)) // Result : 0 16이랑 같거나 큰 수
