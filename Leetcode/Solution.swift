//
//  Solution.swift
//  Leetcode
//
//  Created by 曾昭英 on 2016/12/27.
//  Copyright © 2016年 曾昭英. All rights reserved.
//

import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var dic = Dictionary<Int, Int>()
        var result = Array<Int>()
        
        var i = 0
        
        for num in nums {
            if (dic[target-num] != nil)  {
                result.append(dic[target-num]!)
                result.append(i)
                return result
            }
            dic[num] = i
            i += 1
        }
        return result
    }
    
    func threeSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var result = Array<Int>()

        for i in 0..<nums.count-1 {
            var dic = Dictionary<Int, Int>()
            for j in i+1..<nums.count {
                let x = target-nums[i]-nums[j]
                if (dic[j] != nil)  {
                    result.append(i)
                    result.append(j)
                    result.append(nums.firstIndex(of: x)!)
                    return result
                } else {
                    dic[x] = 1
                }
            }
        }
        return result
    }
    
    
    /*
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 The brackets must close in the correct order, "()" and "()[]{}" are all valid but "(]" and "([)]" are not.
 
*/
    func isValid(_ s: String) -> Bool {
        
        var stack = Array<Character>()
        for c in s {
            
            if c == "(" {
                stack.append(")");
            } else if c == "[" {
                stack.append("]");
            } else if c == "{" {
                stack.append("}");
            } else {
                if stack.popLast() != c {
                    return false
                }
            }
        }
        return stack.count == 0
    }
    
    func isValid1(_ s: String) -> Bool {
        
        var stack = Array<String>()
        let map = ["(":")","[":"]","{":"}"]
        for c in s {
            let str = String(c)
            if map[str] != nil {
                stack.append(str)
            } else if stack.popLast() != str {
                return false
            }
        }
        return stack.count == 0
    }
    
    
//    /// 388. Longest Absolute File Path
//    func lengthLongestPath(_ input: String) -> Int {
//        return 0
//    }
//
//    func parsePathToArray(_ s: String) -> NSArray {
//        var array = Array<String>()
//        var components = s.components(separatedBy: "\n")
//        
//        return Array();
//    }
    
    
    /// 14. Longest Common Prefix
    ///
    /// Write a function to find the longest common prefix string amongst an array of strings.
    
    // 99 ms
    func longestCommonPrefix1(_ strs: [String]) -> String {
        if strs.count < 1 {
            return ""
        }
        
        let firstStr = strs[0]
        var pre = firstStr
        
        for _ in 0 ..< firstStr.count {
            for i in 1 ..< strs.count {
                let str = strs[i]
                if !str.hasPrefix(pre) {
                    pre = pre.substring(to: pre.index(pre.endIndex, offsetBy: -1))
                    break
                }
            }
        }
        
        return pre
    }
    
    /// 28. Implement strStr()
    ///
    /// Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
    
    // Runtime: 82 ms
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let n1 = haystack.count;
        let n2 = needle.count;
        if n2 == 0 {
            return 0
        }
        if n1 < n2 {
            return -1
        }
        for i in 0...n1-n2 {
            let start = haystack.index(haystack.startIndex, offsetBy: i)
            let end = haystack.index(start, offsetBy: n2)
            let range = start..<end
            let subStr = haystack.substring(with: range)
            if subStr == needle {
                return i
            }
        }
        return -1
    }
    
    /// 38. Count and Say
    ///
    /// Given an integer n, generate the nth sequence.
    
    // Runtime: 79 ms
    func countAndSay(_ n: Int) -> String {
        var string = "1"
        for _ in 1 ..< n {
            var preC:Character = string[string.startIndex]
            var count = 0
            var appendStr = ""
            for c in string {
                if c == preC {
                    count += 1
                } else {
                    appendStr.append("\(count)\(preC)")
                    count = 1
                    preC = c
                }
            }
            appendStr.append("\(count)\(preC)")
            string = appendStr
        }
        return string
    }
    
    /// 3. Longest Substring Without Repeating Characters
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var i = 0
        var j = 0
        var maxNum = 0
        var checkDict = [String: Int]()
        for c in s {
            j = j + 1
            if let existingIndex = checkDict[String(c)] {
                i = max(existingIndex, i)
            }
            maxNum = max(maxNum, j - i)
            checkDict[String(c)] = j
        }
        return maxNum
    }
    
    // 优化版，网上参考 https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/solution/wu-zhong-fu-zi-fu-chuan-de-zui-chang-zi-chuan-swif/
    func lengthOfLongestSubstring1(_ s: String) -> Int {
        if s.isEmpty { return 0 }
        let unicode = s.unicodeScalars.map { Int($0.value) }
        var indexs = Array(repeating: -1, count: 128)
        var left = -1
        var maxCount = 0
        
        for i in 0..<unicode.count {
            left = max(left, indexs[unicode[i]])
            indexs[unicode[i]] = i
            maxCount = max(maxCount, i - left)
        }
        return maxCount
    }
    
    /// 括弧组合
    /// n=3 output: ["((()))", "(()())", "(())()", "()(())", "()()()"]
    var result : [String] = []
    func generateParenthesis(_ n: Int) -> [String] {
        
        result = []
        _gen("", n, 0, 0)
        return result
    }
    
    func _gen(_ str: String, _ n: Int, _ leftUsed: Int, _ rightUsed: Int) {
        if leftUsed == n, rightUsed == n {
            result.append(str)
            return
        }
        if leftUsed <= n {
            _gen(str + "(", n, leftUsed + 1, rightUsed)
        }
        if rightUsed < leftUsed {
            _gen(str + ")", n, leftUsed, rightUsed + 1)
        }
    }
    
    /// 152. max product subarray
    /// [2,3,-2,4] => 6
    /// 考虑正负数，动态规划存2个最大小值
    func maxProductSubarray(_ a: [Int]) -> Int {
        
        if a.count == 0 {
            return 0
        }
        
        let firstVal = a[0]
        var maxProduct : Int = firstVal
        var maxI : Int = firstVal
        var minI : Int = firstVal
        
        for i in 1..<a.count {
            let val = a[i]
            let maxT = maxI * val
            let minT = minI * val
            maxI = max(maxT, minT, val)
            minI = min(maxT, minT, val)

            if maxProduct < maxI {
                maxProduct = maxI
            }
        }
        
        return maxProduct
    }
    
    /// 322. Coin Change
    /// [1,2,5] sum=11, min count=>3
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if coins.count == 0 {
            return -1
        }
        var dp = Array(repeating: amount + 1, count: amount+1)    //amount + 1是最大值，就算全是1元，也要amount张一元
        dp[0] = 0
        for i in 1...amount {
            for j in 0..<coins.count {
                if coins[j] <= i {
                    dp[i] = min(dp[i], dp[i-coins[j]]+1)
                }
            }
        }
        
        if dp[amount] > amount {
            return -1
        } else {
            return dp[amount]
        }
    }
    
    /// 72. String Edit Distance
    /// string1-》string2 最少需要的操作步骤，每次操作可以是Insert、Delete或Replace
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1 == word2 {
            return 0
        }
        let m = word1.count
        let n = word2.count
        if m == 0 {
            return n
        }
        if n == 0 {
            return m
        }
        let word1Array = Array(word1)
        let word2Array = Array(word2)
        
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        for i in 1...m {
            dp[i][0] = i
        }
        for j in 1...n {
            dp[0][j] = j
        }
        
        for i in 1...m {
            for j in 1...n {
                if word1Array[i-1] == word2Array[j-1] {
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1
                }
            }
        }
        
        return dp[m][n]
    }

//    2. 两数相加
//    给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
//
//    如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
//
//    您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
//
//    示例：
//
//    输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
//    输出：7 -> 0 -> 8
//    原因：342 + 465 = 807

//    Definition for singly-linked list.
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func addTwoNumbersByArray (_ a1: [Int], _ a2: [Int]) -> [Int] {
        var l1 : ListNode? = nil
        var tempLink : ListNode? = nil
        for i in a1 {
            if l1 != nil {
                tempLink?.next = ListNode(i)
                tempLink = tempLink?.next
            } else {
                l1 = ListNode(i)
                tempLink = l1
            }
        }
        
        var l2 : ListNode? = nil
        for i in a2 {
            if l2 != nil {
                tempLink?.next = ListNode(i)
                tempLink = tempLink?.next
            } else {
                l2 = ListNode(i)
                tempLink = l2
            }
        }
        
        var res = self.addTwoNumbers(l1, l2)
        var a : [Int] = []
        while res != nil {
            a.append(res!.val)
            res = res?.next
        }
        return a
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        if l1 == nil && l2 == nil {
            return nil
        }
        
        let res = ListNode(0)
        var curSum = res
        
        var cur1 = l1
        var cur2 = l2
        var carry = 0
        
        while cur1 != nil || cur2 != nil {
            let sum = (cur1?.val ?? 0) + (cur2?.val ?? 0) + carry
            carry = sum/10
            curSum.next = ListNode(sum%10)
            curSum = curSum.next!
                        
            cur1 = cur1?.next
            cur2 = cur2?.next
        }
        
        if carry > 0 {
            curSum.next = ListNode(carry)
        }
        
        return res.next
    }
    
    // 递归
//    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        var result: ListNode? = nil
//        
//        if l1 == nil && l2 == nil {
//            return result
//        }
//        
//        var h1 = l1
//        var h2 = l2
//        var sum = (h1?.val ?? 0) + (h2?.val ?? 0)
//        if sum >= 10 {
//            sum = sum % 10
//            h1 = h1?.next ?? ListNode(0)
//            h1!.val = h1!.val + 1
//        }else {
//            h1 = h1?.next
//        }
//        result = ListNode(sum)
//        h2 = h2?.next
//        result!.next = addTwoNumbers(h1, h2)
//        
//        return result
//    }
    
    // MARK:7. 整数反转
    func reverse(_ x: Int) -> Int {
        var res = 0
        var t = x
        while t != 0 {
            res = res*10 + t%10
            t = t/10
        }
        
        if res > Int32.max || res < Int32.min {
            return 0
        }
        
        return res
    }
}
