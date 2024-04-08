//
//  empty.swift
//  LinkedList
//
//  Created by Derrick kim on 2/28/24.
//

import Foundation

class LinkedList<T: Equatable> {
    var head: Node<T>?
    var tail: Node<T>?

    var isEmpty: Bool {
        return head == nil
    }

    /// push는 Linked List 맨 앞 요소에 추가되는 메서드
    func push(_ value: T) {
        head = Node(value: value, next: head)

        if tail == nil {
            tail = head
        }
    }

    /// append는 가장 마지막 요소 뒤에 추가됨
    func append(_ value: T) {
        guard !isEmpty else {
            push(value)
            return
        }

        tail?.next = Node(value: value)
        tail = tail?.next
    }

    func node(at index: Int) -> Node<T>? {
        var currentNode = head
        var currentIndex = 0

        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }

        return currentNode
    }

    func insert(_ value: T, after node: Node<T>?) {
        node?.next = Node(value: value, next: node?.next)
    }

    func removeFirst() -> T? {
        let value = head?.value
        head = head?.next

        if isEmpty {
            tail = nil
        }

        return head?.value
    }
}
