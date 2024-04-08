//
//  main.swift
//  WordCompression
//
//  Created by Derrick kim on 2022/11/30.
//

import Foundation

func solution(_ s:String) -> Int {
    let arr = s.map{ String($0) }
    let max = arr.count / 2

    var availableNumbers: [Int] = []

    for index in 1...max {
        if max % index == 0 {
            availableNumbers.append(index)
        }
    }


    print(s.split(by: 1))


    return 0
}

solution("aabbaccc")
//solution("ababcdcdababcdcd")
//print(solution("abcabcdede"))
//solution("abcabcabcabcdededededede")
//print(solution("xababcdcdababcdcd"))

extension String {
    func split(by length: Int) -> [String] {
        var startIndex = self.startIndex
        var results = [Substring]()

        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            results.append(self[startIndex..<endIndex])
            startIndex = endIndex
        }

        return results.map { String($0) }
    }
}
