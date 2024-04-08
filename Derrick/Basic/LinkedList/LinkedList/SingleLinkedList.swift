//
//  SingleLinkedList.swift
//  LinkedList
//
//  Created by Derrick kim on 2/28/24.
//

import Foundation

class SingleLinkedList<Element: Equatable> {
    var head: Node<Element>?
    var tail: Node<Element>?

    var isEmpty: Bool {
        return head == nil
    }

    // 맨 앞에 노드 추가
    func push(value: Element) {
        head = Node(value: value, next: head)

        if tail == nil {
            tail = head
        }
    }

    // 맨 뒤에 노드 추가
    func append(value: Element) {
        guard !isEmpty else {
            push(value: value)
            return
        }

        tail?.next = Node(value: value)
        tail = tail?.next
    }

    // 특정 위치에 노드 추가하기 위한 메서드
    func node(at index: Int) -> Node<Element>? {
        var currentNode = head
        var currentIndex = 0

        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }

        return currentNode
    }

    // 특정 위치에 노드 삽입
    func insert(value: Element, after node: Node<Element>) {
        node.next = Node(value: value, next: node.next)
    }

    // 맨 앞 노드 제거 후 반환
    @discardableResult
    func pop() -> Element? {
        let value = head?.value
        head = head?.next
        if isEmpty {
            tail = nil
        }

        return head?.value
    }

    // 리스트 출력을 위한 메서드
    func printList() {
        var currentNode = head
        print("SingleLinkedList: ", terminator: "")
        while let node = currentNode {
            print(node.value, terminator: " -> ")
            currentNode = node.next
        }
        print("nil")
    }
}
