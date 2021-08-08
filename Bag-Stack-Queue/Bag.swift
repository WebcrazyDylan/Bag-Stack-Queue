//
//  Bag.swift
//  Swift-AGDS
//
//  Created by Derrick Park on 2021-08-04.
//

import Foundation

/// The **Bag** class represents a bag of generic items.
/// It supports insertion and iterating over the items in arbitrary order.
/// This implementation uses a singly linked list with an inner class Node.
/// The *add*, *isEmpty*, and *count* operations take constant time *O(1)*. Iteration takes linear time *O(n)*.
public final class Bag<E> : Sequence {
  /// beginning of bag
  private var first: Node<E>? = nil
  
  /// number of elements in bag
  private(set) var count: Int = 0
  
  /// helper linked list node class
  fileprivate class Node<E> {
    fileprivate var item: E
    fileprivate var next: Node<E>?
    fileprivate init(item: E, next: Node<E>? = nil) {
      self.item = item
      self.next = next
    }
  }
  
  /// Initializes an empty bag.
  public init() {}
  
  /// Returns true if this bag is empty.
  /// - Returns: true if this bag is empty, otherwise false.
  public func isEmpty() -> Bool {
    return first == nil
  }
  
  /// Adds the item to this bag (front)
  /// - Parameter item: the item to add to this bag.
  public func add(item: E) {
    let oldFirst = first
    first = Node<E>(item: item, next: oldFirst)
    count += 1
  }
  
  /// BagIterator that iterates over the items in this bag in arbitrary order. (reverse order)
  public struct BagIterator<E> : IteratorProtocol {
    public typealias Element = E
    
    private var current: Node<E>?
    
    fileprivate init(_ first: Node<E>?) {
      self.current = first
    }
    
    public mutating func next() -> E? {
      if let item = current?.item {
        current = current?.next
        return item
      }
      return nil
    }
  }
  
  /// Returns an iterator that iterates over the items in this bag in reverse order.
  public func makeIterator() -> BagIterator<E> {
    return BagIterator<E>(first)
  }
}

extension Bag: CustomStringConvertible {
  public var description: String {
    return self.reduce(into: "") { $0 += "\($1) -> " }
  }
}
