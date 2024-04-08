//
//  main.swift
//  openChatting
//
//  Created by Derrick kim on 2022/11/29.
//

import Foundation

func solution(_ record:[String]) -> [String] {
    var userDic: [String: String] = [:]
    var answer: [String] = []

    for i in record {
        let info = i.split(separator: " ").map { String($0) }
        let order = info[0]
        let userID = info[1]
        if order == "Enter" || order == "Change" {
            let nickName = info[2]
            userDic.updateValue(nickName, forKey: userID)
        }
    }

    for i in record {
        let info = i.split(separator: " ").map { String($0) }
        let order = info[0]
        let userID = info[1]

        if order == "Enter" {
            answer.append("\(userDic[userID]!)님이 들어왔습니다.")
        } else if order == "Leave" {
            answer.append("\(userDic[userID]!)님이 나갔습니다.")
        }
    }

    return answer
}

print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))

