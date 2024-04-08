//
//  main.swift
//  ConvertingNumber
//
//  Created by Derrick kim on 2023/02/01.
//

import Foundation
//자연수 x를 y로 변환하려고 합니다. 사용할 수 있는 연산은 다음과 같습니다.
//
//x에 n을 더합니다
//x에 2를 곱합니다.
//x에 3을 곱합니다.
//자연수 x, y, n이 매개변수로 주어질 때, x를 y로 변환하기 위해 필요한 최소 연산 횟수를 return하도록 solution 함수를 완성해주세요. 이때 x를 y로 만들 수 없다면 -1을 return 해주세요.

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var cnt: Int = 0
    var q = DoublyLinkedList<Int>()
    var hs: [Int] = []

    q.append(x)

    while(!q.isEmpty()) {
        var size: Int = q.count();
        for(int i=0 ; i<size ; i++) {
            if(q.peek()==y) {
                return cnt;
            }
            helper(q.poll(), y, n, hs, q);
        }
        cnt++;
    }
    return -1;
}

func helper(num: Int, y: Int, n: Int) -> ([Int], [Int]) {
    var hs = Set<Int>()
    var q = [Int]()

    if(num+n <= y && !hs.contains(num+n)) {
        hs.insert(num+n);
        q.append(num+n);
    }

    if(num*2 <= y && !hs.contains(num*2)) {
        hs.insert(num*2);
        q.append(num*2);
    }

    if(num*3 <= y && !hs.contains(num*3)) {
        hs.insert(num*3);
        q.append(num*3);
    }

    return (Array(hs), q)

}

print(solution(10, 40, 5)) // 2
//print(solution(10, 40, 30)) // 1
//print(solution(2, 5, 4)) // -1

final class Node<T: Equatable> {
    var value: T
    var previous: Node<T>?
    var next: Node<T>?

    init(value: T) {
        self.value = value
    }
}

final class DoublyLinkedList<T: Equatable> {
    private var head: Node<T>?
    private weak var tail: Node<T>?

    var isEmpty: Bool {
        return head == nil
    }

    var first: Node<T>? {
        return head
    }
}

extension DoublyLinkedList {
    subscript(index: Int) -> T? {
        guard var node = self.head else {
            return nil
        }

        if index == 0 {
            return node.value
        }

        for _ in 1...index {
            allocate(to: &node)
        }
        return node.value
    }
}

private extension DoublyLinkedList {
    func allocate(to currentNode: inout Node<T>) {
        if let nextCurrentNode = currentNode.next {
            currentNode = nextCurrentNode
        }
    }

    @discardableResult
    func allocate(_ value: T, to node: inout Node<T>) -> Bool {
        guard let next = node.next else {
            return false
        }
        node = next
        return false
    }
}

extension DoublyLinkedList {
    func append(_ value: T) {
        let newNode = Node(value: value)

        guard let tailNode = tail else {
            head = newNode
            tail = newNode
            return
        }

        newNode.previous = tailNode
        tailNode.next = newNode
        tail = newNode
    }

    func remove(_ node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next

        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }

        next?.previous = prev

        if next == nil {
            tail = prev
        }

        node.previous = nil
        node.next = nil

        return node.value
    }
}
