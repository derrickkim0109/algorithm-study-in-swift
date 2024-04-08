//
//  main.swift
//  Greedy
//
//  Created by Derrick kim on 2/29/24.
//

import Foundation

public struct Heap<T> {
    var nodes = [T]()
    private var orderCriteria: (T, T) -> Bool

    public init(sort: @escaping (T, T) -> Bool) {
        // 최대 힙인지 최소 힙인지 기준을 잡는다.
        self.orderCriteria = sort
    }

    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }

    public var count: Int {
        return nodes.count
    }

    public func peek() -> T? {
        return nodes.first
    }

    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }

    public mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }

        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }

    public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }

        let lastIndex = nodes.count-1
        if index != lastIndex {
            nodes.swapAt(index, lastIndex)
            shiftDown(from: index, until: lastIndex)
            shiftUp(index)
        }

        return nodes.removeLast()
    }

    // 변수를 직접 변경해야 하기 때문에 mutating 을 사용한다.
    private mutating func configureHeap(from array: [T]) {
        nodes = array

        /**
         * 힙 트리에서 n/2 - 1 은 하나 위 층위가 된다.
         * shiftDown을 하면서 자리를 잡을 것이기 때문에
         * 마지막 leaf 노드들은 할 필요가 없다.
         */
        for i in stride(from: nodes.count/2 - 1, through: 0, by: -1) {
            shiftDown(i)
        }
    }

    private func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }

    private func leftChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 1
    }

    private func rightChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 2
    }

    /**
     * shiftUp은 자신과 부모를 비교해 바꿔준다.
     */
    private mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex] // 처음에 노드를 저장해두고 인덱스를 구한 후 바꿔준다.
        var parentIndex = self.parentIndex(ofIndex: index)

        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }

        nodes[childIndex] = child
    }

    /**
     * shiftDown은 left, right 자식 중 적합한 녀석이 있으면 바꾸면서 바닥까지 내려간다.
     */
    private mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1

        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index { return }

        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }

    private mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
}

//정렬된 두 묶음의 숫자 카드가 있다고 하자. 각 묶음의 카드의 수를 A, B라 하면 보통 두 묶음을 합쳐서 하나로 만드는 데에는 A+B 번의 비교를 해야 한다. 이를테면, 20장의 숫자 카드 묶음과 30장의 숫자 카드 묶음을 합치려면 50번의 비교가 필요하다.
//
//매우 많은 숫자 카드 묶음이 책상 위에 놓여 있다. 이들을 두 묶음씩 골라 서로 합쳐나간다면, 고르는 순서에 따라서 비교 횟수가 매우 달라진다. 예를 들어 10장, 20장, 40장의 묶음이 있다면 10장과 20장을 합친 뒤, 합친 30장 묶음과 40장을 합친다면 (10 + 20) + (30 + 40) = 100번의 비교가 필요하다. 그러나 10장과 40장을 합친 뒤, 합친 50장 묶음과 20장을 합친다면 (10 + 40) + (50 + 20) = 120 번의 비교가 필요하므로 덜 효율적인 방법이다.
//
//N개의 숫자 카드 묶음의 각각의 크기가 주어질 때, 최소한 몇 번의 비교가 필요한지를 구하는 프로그램을 작성하시오.
//
//

//func minComparisons(for bundles: [Int]) -> Int {
//    // 숫자 카드 묶음 크기들로 최소 힙을 초기화합니다.
//    var heap = Heap<Int>(array: bundles, sort: <)
//    var totalComparisons = 0
//
//    while heap.count > 1 {
//        // 가장 작은 두 묶음을 힙에서 제거합니다.
//        guard let firstBundle = heap.remove(),
//              let secondBundle = heap.remove() else {
//            break
//        }
//
//        // 두 묶음을 합칩니다.
//        let mergedBundle = firstBundle + secondBundle
//
//        // 합친 묶음의 크기를 비교 횟수에 추가합니다.
//        totalComparisons += mergedBundle
//
//        // 합친 묶음을 다시 힙에 삽입합니다.
//        heap.insert(mergedBundle)
//    }
//
//    return totalComparisons
//}
//
//// 예시: 숫자 카드 묶음이 [10, 20, 40]인 경우
//let n = Int(readLine()!)!
//var cardBundles = Array(repeating: 0, count: n)
//
//for i in 0..<n {
//    cardBundles[i] = Int(readLine()!)!
//}
//
//print(minComparisons(for: cardBundles))

//let N = Int(readLine()!)!
//var letters: [String : Int] = [:]
//
//for _ in 0..<N{
//    let word = readLine()!.map{ String($0) }
//    var base = 1
//
//    for letter in word.reversed(){
//        letters[letter, default: 0] += 1 * base
//        base *= 10
//    }
//}
//
//var num = 9
//var total = 0
//
//for value in letters.values.sorted(by: >){
//    total += num * value
//    num -= 1
//}
//print(total)
//수강신청의 마스터 김종혜 선생님에게 새로운 과제가 주어졌다.
//
//김종혜 선생님한테는 Si에 시작해서 Ti에 끝나는 N개의 수업이 주어지는데, 최소의 강의실을 사용해서 모든 수업을 가능하게 해야 한다.
//
//참고로, 수업이 끝난 직후에 다음 수업을 시작할 수 있다. (즉, Ti ≤ Sj 일 경우 i 수업과 j 수업은 같이 들을 수 있다.)
//
//수강신청 대충한 게 찔리면, 선생님을 도와드리자!
// 3
//1 3
//2 4
//3 5
// 강의 정보를 저장할 구조체 정의
//struct Lecture: Comparable {
//    var start: Int
//    var end: Int
//
//    // 시작 시간을 기준으로 오름차순 정렬을 위한 구현
//    static func < (lhs: Lecture, rhs: Lecture) -> Bool {
//        return lhs.start < rhs.start || (lhs.start == rhs.start && lhs.end < rhs.end)
//    }
//}
//
//// 강의 정보 입력 받기
//let N = Int(readLine()!)!
//var lectures = [Lecture]()
//
//for _ in 0..<N {
//    let input = readLine()!.split(separator: " ").map { Int($0)! }
//    lectures.append(Lecture(start: input[0], end: input[1]))
//}
//
//// 강의 시작 시간 기준으로 정렬
//lectures.sort()
//
//// 최소 힙을 사용하여 강의실의 종료 시간 관리
//var rooms = Heap<Int>(sort: <)
//
//for lecture in lectures {
//    // 현재 강의 시작 전에 끝나는 강의실이 있는지 확인
//    if let earliestEnd = rooms.peek(),
//       earliestEnd <= lecture.start {
//        // 강의실 재사용 가능: 가장 빨리 끝나는 강의실 정보 업데이트
//        _ = rooms.remove()
//    }
//    // 현재 강의를 강의실에 배정 (새 강의실 사용 또는 기존 강의실 재사용)
//    rooms.insert(lecture.end)
//}
//
//// 필요한 최소 강의실 수 출력
//print(rooms.count)

//기숙사에서 살고 있는 준규는 한 개의 멀티탭을 이용하고 있다. 준규는 키보드, 헤어드라이기, 핸드폰 충전기, 디지털 카메라 충전기 등 여러 개의 전기용품을 사용하면서 어쩔 수 없이 각종 전기용품의 플러그를 뺐다 꽂았다 하는 불편함을 겪고 있다. 그래서 준규는 자신의 생활 패턴을 분석하여, 자기가 사용하고 있는 전기용품의 사용순서를 알아내었고, 이를 기반으로 플러그를 빼는 횟수를 최소화하는 방법을 고안하여 보다 쾌적한 생활환경을 만들려고 한다.

//예를 들어 3 구(구멍이 세 개 달린) 멀티탭을 쓸 때, 전기용품의 사용 순서가 아래와 같이 주어진다면,
//
//키보드
//헤어드라이기
//핸드폰 충전기
//디지털 카메라 충전기
//키보드
//헤어드라이기
//키보드, 헤어드라이기, 핸드폰 충전기의 플러그를 순서대로 멀티탭에 꽂은 다음 디지털 카메라 충전기 플러그를 꽂기 전에 핸드폰충전기 플러그를 빼는 것이 최적일 것이므로 플러그는 한 번만 빼면 된다.
//
//입력
//첫 줄에는 멀티탭 구멍의 개수 N (1 ≤ N ≤ 100)과 전기 용품의 총 사용횟수 K (1 ≤ K ≤ 100)가 정수로 주어진다. 두 번째 줄에는 전기용품의 이름이 K 이하의 자연수로 사용 순서대로 주어진다. 각 줄의 모든 정수 사이는 공백문자로 구분되어 있다.
//
//출력
//하나씩 플러그를 빼는 최소의 횟수를 출력하시오.

//2 7
//2 3 2 3 1 2 7

// 입력 받기
//let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
//let N = firstLine[0] // 멀티탭 구멍의 개수
//let K = firstLine[1] // 전기 용품의 총 사용횟수
//let devices = readLine()!.split(separator: " ").map { Int($0)! }
//
//var outlets = [Int]() // 현재 멀티탭에 꽂혀 있는 기기
//var removeCount = 0
//
//for i in 0..<K {
//    let device = devices[i]
//
//    // 이미 꽂혀있다면 건너뛰기
//    if outlets.contains(device) {
//        continue
//    }
//
//    // 멀티탭에 빈 공간이 있다면 그냥 꽂기
//    if outlets.count < N {
//        outlets.append(device)
//        continue
//    }
//
//    // 빈 공간이 없다면, 가장 나중에 사용되거나 전혀 사용되지 않을 기기를 찾아서 빼기
//    var lastIndex = -1
//    var deviceToReplace = -1
//    for outlet in outlets {
//        if let index = devices[i...].firstIndex(of: outlet) {
//            if index > lastIndex {
//                lastIndex = index
//                deviceToReplace = outlet
//            }
//        } else {
//            deviceToReplace = outlet
//            break
//        }
//    }
//
//    if let index = outlets.firstIndex(of: deviceToReplace) {
//        outlets.remove(at: index) // 가장 나중에 사용되는 기기 빼기
//        removeCount += 1
//    }
//
//    outlets.append(device) // 새 기기 꽂기
//}
//
//print(removeCount)


//문제
//수빈이는 A와 B로만 이루어진 영어 단어가 존재한다는 사실에 놀랐다. 대표적인 예로 AB (Abdominal의 약자), BAA (양의 울음 소리), AA (용암의 종류), ABBA (스웨덴 팝 그룹)이 있다.
//
//이런 사실에 놀란 수빈이는 간단한 게임을 만들기로 했다. 두 문자열 S와 T가 주어졌을 때, S를 T로 바꾸는 게임이다. 문자열을 바꿀 때는 다음과 같은 두 가지 연산만 가능하다.
//
// - 문자열의 뒤에 A를 추가한다.
// - 문자열을 뒤집고 뒤에 B를 추가한다.
//주어진 조건을 이용해서 S를 T로 만들 수 있는지 없는지 알아내는 프로그램을 작성하시오.
//
//입력
//첫째 줄에 S가 둘째 줄에 T가 주어진다. (1 ≤ S의 길이 ≤ 999, 2 ≤ T의 길이 ≤ 1000, S의 길이 < T의 길이)
//
//출력
//S를 T로 바꿀 수 있으면 1을 없으면 0을 출력한다.
// B
// ABBA

// A를 넣어
// BA
// B를 넣어
// ABB
// A를 넣어
// ABBA

//let S = readLine()!
//var T = readLine()!
//
//var flag = false
//while true {
//    if T.count == S.count {
//        if S == T {
//            flag = true
//        }
//        break
//    }
//
//    if T.last! == "A" {
//        T.removeLast()
//    } else {
//        T.removeLast()
//        T = T.reversed().map{String($0)}.joined()
//    }
//}
//
//print(flag ? "1" : "0")

//문제
//웅찬이는 과제가 많다. 하루에 한 과제를 끝낼 수 있는데, 과제마다 마감일이 있으므로 모든 과제를 끝내지 못할 수도 있다. 과제마다 끝냈을 때 얻을 수 있는 점수가 있는데, 마감일이 지난 과제는 점수를 받을 수 없다.
//
//웅찬이는 가장 점수를 많이 받을 수 있도록 과제를 수행하고 싶다. 웅찬이를 도와 얻을 수 있는 점수의 최댓값을 구하시오.
//
//입력
//첫 줄에 정수 N (1 ≤ N ≤ 1,000)이 주어진다.
//
//다음 줄부터 N개의 줄에는 각각 두 정수 d (1 ≤ d ≤ 1,000)와 w (1 ≤ w ≤ 100)가 주어진다. d는 과제 마감일까지 남은 일수를 의미하며, w는 과제의 점수를 의미한다.
//
//출력
//얻을 수 있는 점수의 최댓값을 출력한다.

// 7
//4 60
//4 40
//1 20
//2 50
//3 30
//4 10
//6 5

// 과제의 개수를 입력받습니다.
//let n = Int(readLine()!)!
//// 과제의 마감일과 점수를 저장할 배열을 초기화합니다.
//var arr = [(dueDate: Int, score: Int)]()
//// 마감일이 사용되었는지 확인하기 위한 배열을 초기화합니다. 최대 1000일까지 고려합니다.
//var visited = [Bool](repeating: false, count: 1001)
//// 얻을 수 있는 점수의 합계를 저장할 변수를 초기화합니다.
//var sum = 0
//
//// n개의 과제 정보(마감일과 점수)를 입력받아 arr 배열에 저장합니다.
//for _ in 0..<n {
//    let input = readLine()!.split(separator: " ").map{Int($0)!}
//    arr.append((input[0], input[1]))
//}
//
//// 과제를 점수가 높은 순으로 정렬합니다. 점수가 높은 과제부터 선택하기 위함입니다.
//arr.sort(by: {$0.score > $1.score})
//
//// 정렬된 과제 배열을 순회합니다.
//for x in arr {
//    // 과제의 마감일을 dueDate 변수에 저장합니다.
//    var dueDate = x.dueDate
//    // 해당 마감일이 이미 선택되었거나(visited[dueDate] == true), dueDate가 0보다 큰 동안 반복합니다.
//    while visited[dueDate], dueDate > 0 {
//        // 이미 선택된 마감일이라면, 하루 전으로 이동합니다.
//        dueDate -= 1
//    }
//
//    // 유효한 마감일(0이 아닌)을 찾았다면,
//    if dueDate != 0 {
//        // 해당 마감일을 선택되었다고 표시합니다.
//        visited[dueDate] = true
//        // 해당 과제의 점수를 합계에 추가합니다.
//        sum += x.score
//    }
//}
//
//// 최종적으로 선택된 과제들의 점수 합계를 출력합니다.
//print(sum)


//let N = Int(readLine()!)!
//var heap = Heap<Int>(sort: <)
//
//for _ in 0..<N {
//    let x = Int(readLine()!)!
//    if x == 0 {
//        print(heap.remove() ?? 0)
//    } else {
//        heap.insert(x)
//    }
//}
