//
//  main.swift
//  DiskController
//
//  Created by Derrick kim on 2023/04/11.
//

import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    //
    var sortedByStartTimeJobs = jobs.sorted(by: {
        if $0.first! == $1.first! {
            return $0.last! > $1.last!
        } else {
            return $0.first! > $1.first!
        }
    })

    var jobQueue: [[Int]] = [sortedByStartTimeJobs.removeLast()]
    var totalTime = 0
    var currentTime = jobQueue.first![0]

    while !jobQueue.isEmpty {
        let now = jobQueue.removeLast()
        totalTime += abs(currentTime - now.first!) + now.last!
        currentTime += now.last!

        while !sortedByStartTimeJobs.isEmpty
                && sortedByStartTimeJobs.last![0] <= currentTime {
            jobQueue.append(sortedByStartTimeJobs.removeLast())
        }

        jobQueue.sort(by: { $0.last! > $1.last! })

        if jobQueue.isEmpty && !sortedByStartTimeJobs.isEmpty {
            jobQueue.append(sortedByStartTimeJobs.removeLast())
            currentTime += abs(currentTime - jobQueue.last![0])
        }
    }

    return totalTime / jobs.count
}

func solution1(_ jobs:[[Int]]) -> Int {
    // 가장 시간이 덜 걸리는 순서
    var sortedJobsQueue = jobs.sorted(by: {
        if $0.last! == $1.last! {
            return $0.first! < $1.first!
        } else {
            return $0.last! < $1.last!
        }
    })


    var time = 0
    var result = 0

    while !sortedJobsQueue.isEmpty {
        for (index, element) in sortedJobsQueue.enumerated() {
            if element.first! <= time {
                time += element.last!
                result += time - element.first!
                sortedJobsQueue.remove(at: index)
                break
            }

            if index == sortedJobsQueue.count - 1 {
                time += 1
            }
        }
    }
    return result / jobs.count
}

print(solution([[0, 3], [1, 9], [2, 6]]))
print(solution1([[0, 3], [1, 9], [2, 6]]))
