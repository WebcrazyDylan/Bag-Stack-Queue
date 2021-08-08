//
//  main.swift
//  Bag-Stack-Queue
//
//  Created by Dylan Park on 2021-08-04.
//

import Foundation

print("Bag")
let bag = Bag<Int>()
bag.add(item: 10)
bag.add(item: 1)
bag.add(item: 8)
bag.add(item: 7)
bag.add(item: 6)
bag.add(item: 5)
print("count \(bag.count)")

for item in bag {
    print(item)
}
print("bag \(bag)")


print("\nStack")
let stack = Stack<Int>()
stack.push(item: 1)
stack.push(item: 2)
stack.push(item: 3)
stack.push(item: 4)
stack.push(item: 5)
stack.push(item: 6)
print("count \(stack.count)")
print("stack \(stack)")

if !stack.isEmpty() {
    print("peek \(stack.peek()!)")
} else {
    print("stack is empty.")
}
print("count \(stack.count)")
print("stack \(stack)")

while !stack.isEmpty() {
    print("pop \(stack.pop()!)")
}
print("count \(stack.count)")
print("stack \(stack)")

stack.push(item: 100)
print("count \(stack.count)")
print("stack \(stack)")



print("\nQueue")
let queue = Queue<Int>()
queue.enqueue(item: 1)
queue.enqueue(item: 2)
queue.enqueue(item: 3)
queue.enqueue(item: 4)
queue.enqueue(item: 5)
queue.enqueue(item: 6)
print("count \(queue.count)")
print("queue \(queue)")

print("dequeue \(queue.dequeue()!)")

print("count \(queue.count)")
print("queue \(queue)")

queue.enqueue(item: 50)
print("peek \(queue.peek()!)")

print("count \(queue.count)")
print("queue \(queue)")
