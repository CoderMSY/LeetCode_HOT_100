//
//  main.swift
//  2. Add Two Numbers
//
//  Created by Simon Miao on 2021/10/11.
//

import Foundation
/*
 2. 两数相加
 难度:中等
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

 请你将两个数相加，并以相同形式返回一个表示和的链表。

 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var currentL1 = l1
        var currentL2 = l2
        var resultNode: ListNode?
        var currentNode: ListNode?
        var lastDecimal = 0

        while (currentL1 != nil || currentL2 != nil)  {
            let val1 = currentL1?.val ?? 0
            let val2 = currentL2?.val ?? 0
            let value = val1 + val2 + lastDecimal
            let remainder = value % 10
            
            if resultNode == nil {
                resultNode = ListNode.init(remainder)
                currentNode = resultNode
            }
            else {
                let nextNode = ListNode.init(remainder)
                currentNode?.next = nextNode
                currentNode = nextNode
            }
            
            lastDecimal = value / 10
            currentL1 = currentL1?.next
            currentL2 = currentL2?.next
        }
        
        if lastDecimal != 0 {
            currentNode?.next = ListNode.init(lastDecimal)
        }
        
        return resultNode
    }
}

//num转ListNode
func getListNode(num: Int) -> ListNode? {
    var nums = String(num).compactMap({Int(String($0))})
    nums = nums.reversed()
    
    let node = getListNode(list: nums)
    
    return node
}
// 数组转ListNode
func getListNode(list: [Int]) -> ListNode? {
    var firstNode: ListNode? = nil
    
    var lastNode: ListNode? = nil
    for num in list {
        let currentNode = ListNode(num)
        
        if lastNode != nil {
            lastNode?.next = currentNode
        }
        else {
            firstNode = currentNode
        }
        
        lastNode = currentNode
    }
    
    return firstNode
}

// ListNode转数组
func getNodeNums(_ node: ListNode?) -> [Int] {
    var nums: [Int] = []
    var currentNode = node
    while (currentNode != nil) {
        nums.append(currentNode!.val)
        
        currentNode = currentNode?.next
    }
    
    return nums
}

//生成ListNode
//let l1 = getListNode(list: [2,4,3])
//let l2 = getListNode(list: [5,6,4])
//输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
//输出：[8,9,9,9,0,0,0,1]
let l1 = getListNode(list: [9,9,9,9,9,9,9])
let l2 = getListNode(list: [1,9,9,9])

//let l1 = getListNode(list: [0])
//let l2 = getListNode(list: [0])

//let l1 = getListNode(list: [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1])
//let l2 = getListNode(list: [5,6,4])
let sol = Solution.init()
let resultNode = sol.addTwoNumbers(l1, l2)
//打印node
let showNums = getNodeNums(resultNode)
print(showNums)


