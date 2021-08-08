//
//  Stack.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2021-08-04.
//

import Foundation

/// The Stack class represents a last-in-first-out (LIFO) stack of generic items.
/// It supports the usual *push* and *pop* operations, along with methods for peeking at the top item, testing if the stack is empty, and iterating through the items in LIFO order.
/// This implementation uses a singly linked list with an inner class for linked list nodes.
public final class Stack<E> : Sequence {
    private var top: Node<E>? = nil
    
    // private(set) count
    private(set) var count: Int = 0
    
    fileprivate class Node<E> {
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>? = nil) {
            self.item = item
            self.next = next
        }
    }
    
    // init()
    public init() {}
    
    // isEmpty() -> Bool
    public func isEmpty() -> Bool {
        return top == nil
    }
    
    // push(item: E)
    public func push(item: E) {
        let oldTop = top
        top = Node<E>(item: item, next: oldTop)
        count += 1
    }
    
    // pop() -> E?
    /* removes and returns the item most recently added to the stack */
    public func pop() -> E? {
        if let oldTop = top {
            top = oldTop.next
            count -= 1
            return oldTop.item
        } else {
            return top?.item
        }
    }
    
    // peek() -> E?
    /* returns (but does not remove) the item most recently added to the stack. */
    public func peek() -> E? {
        if let peek = top {
            return peek.item
        } else {
            return top?.item
        }
    }
    
    // makeIterator() -> StackIterator<E>
    public struct StackIterator<E> : IteratorProtocol {
        public typealias Element = E
        
        private var current: Node<E>?
        
        fileprivate init(_ top: Node<E>?) {
            self.current = top
        }
        
        public mutating func next() -> E? {
            if let item = current?.item {
                current = current?.next
                return item
            }
            return nil
        }
    }
    
    public func makeIterator() -> StackIterator<E> {
        return StackIterator<E>(top)
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        var str: String = self.reduce(into: "") { $0 += "\($1), " }
        if !self.isEmpty() {
            str.removeLast(2)
        }
        return "[" + str + "]"
    }
}
