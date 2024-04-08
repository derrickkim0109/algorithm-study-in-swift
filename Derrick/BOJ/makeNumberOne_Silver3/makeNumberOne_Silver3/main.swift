//
//  main.swift
//  makeNumberOne_Silver3
//
//  Created by Derrick kim on 2023/08/24.
//

import Foundation

//정수 X에 사용할 수 있는 연산은 다음과 같이 세 가지 이다.
//
//X가 3으로 나누어 떨어지면, 3으로 나눈다.
//X가 2로 나누어 떨어지면, 2로 나눈다.
//1을 뺀다.
//정수 N이 주어졌을 때, 위와 같은 연산 세 개를 적절히 사용해서 1을 만들려고 한다. 연산을 사용하는 횟수의 최솟값을 출력하시오.

let number = Int(readLine()!)!

func dp(number: Int) -> Int {
    if number % 3 == 0 {
        return dp(number: number % 3)
    } else if number % 2 == 0 {
        return dp(number: number % 2)
    }

    return dp(number: number - 1)
}
