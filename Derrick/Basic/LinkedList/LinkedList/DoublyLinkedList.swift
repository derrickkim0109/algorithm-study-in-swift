//
//  DoublyLinkedList.swift
//  LinkedList
//
//  Created by Derrick kim on 2/28/24.
//

import Foundation

class DoublyLinkedList<Element: Equatable> {
    var head: Node<Element>?
    var tail: Node<Element>?

    var isEmpty: Bool {
        return head == nil
    }

    // 맨 앞에 노드 추가
    func push(value: Element) {
        let newNode = Node(value: value)
        
        guard let headNode = head else {
            head = newNode
            tail = newNode
            return
        }

        newNode.next = headNode
        headNode.previous = newNode
        head = newNode
    }

    // 맨 뒤에 노드 추가
    func append(value: Element) {
        guard !isEmpty else {
            push(value: value)
            return
        }

        let newNode = Node(value: value)
        newNode.previous = tail
        tail?.next = newNode
        tail = newNode
    }

    // 특정 위치의 노드 반환
    func node(at index: Int) -> Node<Element>? {
        var currentNode = head
        var currentIndex = 0

        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }

        return currentNode
    }

    // 특정 노드 뒤에 새 노드 삽입
    func insert(value: Element, after node: Node<Element>) {
        guard tail !== node else {
            append(value: value)
            return
        }
        let newNode = Node(value: value)
        newNode.previous = node
        newNode.next = node.next
        node.next?.previous = newNode
        node.next = newNode
    }

    // 맨 앞 노드 제거
    @discardableResult
    func pop() -> Element? {
        defer {
            head = head?.next
            head?.previous = nil
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }

    // 맨 뒤 노드 제거
    @discardableResult
    func removeLast() -> Element? {
        guard let tailNode = tail else {
            return nil
        }

        tail = tailNode.previous
        
        if isEmpty {
            head = nil
        } else {
            tail?.next = nil
        }
        return tailNode.value
    }

    // 리스트 출력
    func printList() {
        var currentNode = head
        print("DoublyLinkedList: ", terminator: "")
        while let node = currentNode {
            print(node.value, terminator: " -> ")
            currentNode = node.next
        }
        print("nil")
    }
}
