//
//  Node.swift
//  LinkedList
//
//  Created by Derrick kim on 2/28/24.
//

import Foundation

final class Node<Element> {
    var value: Element
    var next: Node?
    weak var previous: Node?

    init(value: Element, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
