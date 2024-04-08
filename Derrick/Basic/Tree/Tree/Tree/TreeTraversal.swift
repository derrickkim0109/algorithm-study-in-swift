//
//  TreeTraversal.swift
//  Tree
//
//  Created by Derrick kim on 2/21/24.
//

import Foundation

//struct TreeTraversal {
//    // In-order 순회
//    func inOrderTraversal(_ root: TreeNode<Int>?) {
//        guard let root = root else {
//            return
//        }
//
//        inOrderTraversal(root.left)
//        print(root.value)
//        inOrderTraversal(root.right)
//    }
//
//    // Pre-order 순회
//    func preOrderTraversal(_ root: TreeNode<Int>?) {
//        guard let root = root else {
//            return
//        }
//
//        print(root.value)
//        preOrderTraversal(root.left)
//        preOrderTraversal(root.right)
//    }
//
//    // Post-order 순회
//    func postOrderTraversal(_ root: TreeNode<Int>?) {
//        guard let root = root else {
//            return
//        }
//
//        postOrderTraversal(root.left)
//        postOrderTraversal(root.right)
//        print(root.value)
//    }
//
//    // Level-order 순회
//    func levelOrderTraversal(_ root: TreeNode<Int>?) {
//        guard let root = root else {
//            return
//        }
//
//        var queue: [TreeNode<Int>] = [root]
//
//        while !queue.isEmpty {
//            let node = queue.removeFirst()
//
//            print(node.value)
//
//            if let left = node.left {
//                queue.append(left)
//            }
//
//            if let right = node.right {
//                queue.append(right)
//            }
//        }
//    }
//}
