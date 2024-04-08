//
//  main.swift
//  문자열 내 p와 y의 개수
//
//  Created by Derrick kim on 2023/04/12.
//

import Foundation

func solution(_ s:String) -> Bool
{
    var ans:Bool = false
    let pCount = s.filter { $0.lowercased() == "p" }.count
    let yCount = s.filter { $0.lowercased() == "y" }.count

    if (pCount == 0 && yCount == 0)
        || pCount == yCount {
        ans = true
    } else if pCount != yCount {
        ans = false
    }

    return ans
}

print(solution("pPoooyY"))
