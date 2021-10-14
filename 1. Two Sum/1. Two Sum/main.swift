//
//  main.swift
//  1. Two Sum
//
//  Created by Simon Miao on 2021/10/11.
//

import Foundation

print("Hello, World!")

/* 1. 两数之和
 难度：简单
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

 你可以按任意顺序返回答案。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/two-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution {
    // 方法一：暴力枚举
    /*
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for (i, num) in nums.enumerated() {
            var j = i + 1
            
            while j < nums.count {
                let value = num + nums[j]
                if value == target {
                    return [i, j]
                }
                else {
                    j += 1
                }
            }
        }
        
        return []
    }
 */
    //方法二：哈希表
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int: Int]()
        for (i, num) in nums.enumerated() {
            if let pairedIndex = dic[target - num] {
                return [pairedIndex, i]
            } else {
                dic[num] = i
            }
        }
        return []
    }
}

let sol = Solution.init()
let value = sol.twoSum([2, 7, 13, 11, 11], 18)
let value1 = sol.twoSum([], 9)
print("result:\(value)")

