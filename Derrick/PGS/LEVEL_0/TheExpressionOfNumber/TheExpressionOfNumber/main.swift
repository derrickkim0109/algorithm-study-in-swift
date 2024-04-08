//
//  main.swift
//  TheExpressionOfNumber
//
//  Created by Derrick kim on 2023/04/11.
//

import Foundation

func solution(_ s:String) -> String {
    let numbers = s.split(separator: " ").map { Int($0)! }
    let min = numbers.min()!
    let max = numbers.max()!
    
    return "\(min) \(max)"
}


print(solution("-1 -2 -3 -4"))
