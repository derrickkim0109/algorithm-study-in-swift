//
//  main.swift
//  LinkedList
//
//  Created by Derrick kim on 2/28/24.
//

import Foundation

let doublyLinkedList = DoublyLinkedList<Int>()
doublyLinkedList.push(value: 1)
doublyLinkedList.append(value: 2)
doublyLinkedList.append(value: 3)
doublyLinkedList.push(value: 0)
doublyLinkedList.push(value: 5)
doublyLinkedList.printList() // 0 -> 1 -> 2 -> 3 -> nil

if let node2 = doublyLinkedList.node(at: 2) {
    doublyLinkedList.insert(value: 4, after: node2)
}
doublyLinkedList.printList() // 0 -> 1 -> 2 -> 4 -> 3 -> nil

let singleLinkedList = SingleLinkedList<Int>()
singleLinkedList.push(value: 3)
singleLinkedList.append(value: 7)
singleLinkedList.push(value: 2)
singleLinkedList.push(value: 1)

singleLinkedList.append(value: 4)

singleLinkedList.printList() // 1 -> 2 -> 3 -> 4 -> nil
