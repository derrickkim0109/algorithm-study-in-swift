//
//  Heap.swift
//  Dijkstra
//
//  Created by Derrick kim on 3/4/24.
//

import Foundation

public struct Heap<T> {
    private var nodes = [T]()
    private var orderCriteria: (T, T) -> Bool

    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    public var isEmpty: Bool {
        return nodes.isEmpty
    }

    public var count: Int {
        return nodes.count
    }

    public func peek() -> T? {
        return nodes.first
    }

    public func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }

    public func leftChildIndex(of index: Int) -> Int { 
        return 2 * index + 1
    }

    public func rightChildIndex(of index: Int) -> Int { 
        return 2 * index + 2
    }

    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(from: count - 1)
    }

    // For max-heap
    public mutating func remove() -> T? {
        guard !isEmpty else {
            return nil
        }

        if count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(from: 0, until: count)
            return value
        }
    }
}

extension Heap {
    private mutating func shiftUp(from index: Int) {
        var childIndex = index
        let childNode = nodes[childIndex]
        var parentIndex = self.parentIndex(of: childIndex)

        while childIndex > 0,
              orderCriteria(childNode, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }

        nodes[childIndex] = childNode
    }

    private mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = leftChildIndex(of: index)
        let rightChildIndex = rightChildIndex(of: index)
        var first = index

        if leftChildIndex < endIndex,
           orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }

        if rightChildIndex < endIndex, orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        
        if first == index {
            return
        }

        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
}
