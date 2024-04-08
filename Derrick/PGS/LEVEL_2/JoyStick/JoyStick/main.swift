//
//  main.swift
//  JoyStick
//
//  Created by Derrick kim on 2023/04/14.
//

import Foundation

func solution(_ name:String) -> Int {
    guard name.count >= 1 || name.count <= 20 else {
        return 0
    }

    let nameArray = name.map { $0 }
    var answer = 0

    for index in 0..<name.count {
        if nameArray[index] != "A" {
            let up = nameArray[index].asciiValue! - 65
            let down = 91 - nameArray[index].asciiValue!

            answer += Int((up < down) ? up : down)
        }
    }

    var minMove = name.count - 1

    for i in 0..<name.count {
        if nameArray[i] != "A" {
            var next = i + 1
            while next < nameArray.count && nameArray[next] == "A" {
                next += 1
            }

            let move = (2 * i) + name.count - next
            minMove = min(move, minMove)
        }
    }

    return answer + minMove
}

print(solution("JEROEN"))
