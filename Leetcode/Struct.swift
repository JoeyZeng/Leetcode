//
//  Struct.swift
//  Leetcode
//
//  Created by zengzhaoying on 2021/11/1.
//  Copyright © 2021 曾昭英. All rights reserved.
//

import Foundation

//    Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

public struct Stack<T> {
     fileprivate var array = [T]()
     public var isEmpty: Bool {
         return array.isEmpty
     }
     public var count: Int {
        return array.count
     }
     public mutating func push(_ element: T) {
        array.append(element)
     }
     @discardableResult public mutating func pop() -> T? {
        return array.popLast()
     }
     public var top: T? {
        return array.last
     }
}
