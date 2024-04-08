//
//  main.swift
//  ReversedString
//
//  Created by Derrick kim on 12/30/23.
//

import Foundation

//func solution(_ my_string:String, _ s:Int, _ e:Int) -> String {
//    let startIndex = my_string.index(my_string.startIndex, offsetBy: s)
//    let endIndex = my_string.index(my_string.startIndex, offsetBy: e)
//    let lastIndex = endIndex != my_string.endIndex ? my_string.index(my_string.startIndex, offsetBy: e + 1) : endIndex
//
//    let headString = startIndex != my_string.startIndex ? my_string[my_string.startIndex..<startIndex] : ""
//    let targetString = my_string[startIndex...endIndex].map { String($0) }.reversed().joined()
//
//    let tailString = endIndex != my_string.endIndex ? my_string[lastIndex...] : ""
//
//    return headString + targetString + tailString
//}

//print(solution("Progra21Sremm3", 6, 12))

//func solution(_ q:Int, _ r:Int, _ code:String) -> String {
//    let array = code.map { String($0) }
//    var answer = ""
//
//    for index in 0..<array.count {
//        if index % q == r {
//            answer += array[index]
//        }
//    }
//
//    return answer
//}
//
//print(solution(3, 1, "qjnwezgrpirldywt"))

func solution(_ my_string:String) -> [Int] {
    var upperCaseArray = Array(repeating: 0, count: 26)
    var lowerCaseArray = Array(repeating: 0, count: 26)

    for char in my_string {
        if char.isLetter {
            let index = char.asciiValue!
            let startChar = (char.isUppercase) ? UInt8(UnicodeScalar("A").value) : UInt8(UnicodeScalar("a").value)
            let position = Int(index - startChar)

            if char.isUppercase {
                upperCaseArray[position] += 1
            } else {
                lowerCaseArray[position] += 1
            }
        }
    }

    return upperCaseArray + lowerCaseArray
}

//print(solution("Programmers"))

//let input = Int(readLine()!)!
//var x = 0
//var y = 0
//var result = [String]()
//
//for _ in 0..<input {
//    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
//    let H = info[0]
//    let N = info[2]
//
//    x = N / H + 1
//    y = N % H
//
//    if (y == 0) {
//        y = H
//        x -= 1
//    }
//
//    let formattedString = String(format: "%d%02d", y, x)
//    result.append(formattedString)
//}
//
//for r in result {
//    print(r)
//}


func solution(_ arr:[Int], _ query:[Int]) -> [Int] {
    var answer = arr

    for index in query {
        if index % 2 == 0 {
            answer = Array(answer[0...index])
        } else {
            answer = Array(answer[index...])
        }
    }

    return answer
}

print(solution([0, 1, 2, 3, 4, 5], [4, 1, 2]))
