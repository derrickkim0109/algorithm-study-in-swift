//
//  Heap.swift
//  Heap
//
//  Created by Derrick kim on 2/20/24.
//

import Foundation

//struct Heap<T: Comparable> {
//    var elements: Array<T> = []
//
//    init(data: T) {
//        elements.append(data) // 0번 index 채우기용
//    }
//
//    mutating func push(_ data: T) {
//        elements.append(data)
//
//        let insertIndex = elements.count - 1
//
//        siftUp(from: insertIndex)
//    }
//
//    mutating func pop() -> T? {
//        guard !elements.isEmpty else {
//            return nil
//        }
//
//        elements.swapAt(1, elements.count - 1)
//        let poppedElement = elements.removeLast()
//
//        siftDown(from: 1)
//        return poppedElement
//    }
//
//    func printHeap() {
//          var level = 0
//          var nodesToPrint = 1
//          var nodesPrinted = 1
//
//          while nodesPrinted < elements.count {
//              var str = ""
//              for _ in 0..<nodesToPrint {
//                  if nodesPrinted < elements.count {
//                      str += "\(elements[nodesPrinted]) "
//                      nodesPrinted += 1
//                  }
//              }
//              print("Level \(level): \(str)")
//              nodesToPrint *= 2
//              level += 1
//          }
//      }
//}
//
//extension Heap {
//    mutating private func siftUp(from index: Int) {
//        var childIndex = index
//        var parentIndex = getParentNodeIndex(of: childIndex)
//
//        /// max Heap
//        /// elements[childIndex] > elements[parentIndex]
//        /// min Heap
//        /// elements[childIndex] < elements[parentIndex]
//        while childIndex > 1 && elements[childIndex] >= elements[parentIndex] {
//            elements.swapAt(childIndex, parentIndex)
//            childIndex = parentIndex
//            parentIndex = getParentNodeIndex(of: childIndex)
//        }
//    }
//
//    mutating private func siftDown(from index: Int) {
//        var parentNodeIndex = index
//
//        while true {
//            let leftChildNodeIndex = getLeftChildNodeIndex(of: parentNodeIndex)
//            let rightChildNodeIndex = getRightChildNodeIndex(of: parentNodeIndex)
//            var targetNodeIndex = parentNodeIndex
//
//            /// max Heap
//            /// elements[leftChildNodeIndex] > elements[targetNodeIndex]
//            /// min Heap
//            /// elements[leftChildNodeIndex] < elements[targetNodeIndex]
//            if leftChildNodeIndex < elements.count && elements[leftChildNodeIndex] > elements[targetNodeIndex] {
//                targetNodeIndex = leftChildNodeIndex
//            }
//
//            /// max Heap
//            /// elements[rightChildNodeIndex] > elements[targetNodeIndex]
//            /// min Heap
//            /// elements[rightChildNodeIndex] < elements[targetNodeIndex]
//            if rightChildNodeIndex < elements.count && elements[rightChildNodeIndex] > elements[targetNodeIndex] {
//                targetNodeIndex = rightChildNodeIndex
//            }
//
//            if targetNodeIndex == parentNodeIndex {
//                break
//            }
//
//            elements.swapAt(parentNodeIndex, targetNodeIndex)
//
//            parentNodeIndex = targetNodeIndex
//        }
//    }
//
//    private func getParentNodeIndex(of index: Int) -> Int {
//        return index / 2
//    }
//
//    private func getLeftChildNodeIndex(of index: Int) -> Int {
//        return 2 * index
//    }
//
//    private func getRightChildNodeIndex(of index: Int) -> Int {
//        return (2 * index) + 1
//    }
//}

public struct Heap<T> {

    private var nodes = [T]()

    private var orderCriteria: (T, T) -> Bool

    public init(sort: @escaping (T, T) -> Bool) {
        // 최대 힙인지 최소 힙인지 기준을 잡는다.
        self.orderCriteria = sort
    }

    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }

    public var isEmpty: Bool {
        return count == 0
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
