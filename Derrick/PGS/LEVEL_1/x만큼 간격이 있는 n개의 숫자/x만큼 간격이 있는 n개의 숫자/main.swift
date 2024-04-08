//
//  main.swift
//  x만큼 간격이 있는 n개의 숫자
//
//  Created by Derrick kim on 2023/04/12.
//

import Foundation

func solution(_ x:Int, _ n:Int) -> [Int64] {
    return (1...n).map { Int64($0 * x) }
}

print(solution(2, 5))
print(solution(4, 3))
print(solution(-4, 2))
