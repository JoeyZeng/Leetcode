//
//  LeetcodeTests.swift
//  LeetcodeTests
//
//  Created by 曾昭英 on 2016/12/27.
//  Copyright © 2016年 曾昭英. All rights reserved.
//

import XCTest

//@testable import Leetcode

class LeetcodeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testTwoSum() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let solution = Solution()
        let result = solution.twoSum([3,2,4], 6)
        print(result)
    }
    
    func testThreeSum() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let solution = Solution()
        let result = solution.threeSum([-1,-2,0,1,2], 0)
        print(result)
    }
    
    func testStringIsValid() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let solution = Solution()
        let result = solution.isValid1("()[{}]")
        print(result)
    }
    
    func testLongestCommonPrefix() {
        let solution = Solution()
//        let array = ["abc", "abc12", "abc3", "abc5"]
        let array = ["abab","aba",""]
        let result = solution.longestCommonPrefix1(array)
        print(result)
    }
    
    func testStrStr() {
        let solution = Solution()
        let result = solution.strStr("aaaaab", "aaaab")
        print(result)
    }
    
    func testCountAndSay() {
        let solution = Solution()
        let result = solution.countAndSay(5)
        print(result)
    }
    
    func testGenerateParenthesis() {
        let solution = Solution()
        let result = solution.generateParenthesis(3)
        print(result)
    }
    
    func testMaxProductSubarray() {
        let solution = Solution()
        let a = [2,3,-2,4,-5]
        let result = solution.maxProductSubarray(a)
        print(result)
    }
    
    func testCoinChange() {
        let solution = Solution()
        let a = [1,2,5]
        let result = solution.coinChange(a, 11)
        print(result)
    }
    
    func testMinDistance() {
        let solution = Solution()
        let result = solution.minDistance("horse", "ros")
        print(result)
    }
    
    func testAddTwoNumbers() {
        let solution = Solution()
        let result = solution.addTwoNumbersByArray([0], [3,7])
        print(result)
        XCTAssert(result.elementsEqual([3,7]))
    }
    
    func testLengthOfLongestSubstring() {
        let solution = Solution()
        let result = solution.lengthOfLongestSubstring1("abba1")
        XCTAssert(result == 3)
    }
    
    func testReverse() {
        let solution = Solution()
        let result = solution.reverse(120)
        XCTAssert(result == 21)
    }
    
    func testPartition() {
        let solution = Solution()
        var a = [3,2,6,5,1,4,0]
        let result = solution.partition(&a, 0, a.count-1)
        print("sort array is \(a) \nindex is \(result)")
    }
    
    func testGetLeastNumbers() {
        let solution = Solution()
        let a = [3,2,6,5,1,4,0]
        let result = solution.getLeastNumbers(a, 2)
//        let result = solution.quickSort(a)
        print("origin array is \(a) \n k array is \(result)")
    }
    
    func testPrintABC() {
            let solution = Solution()
            solution.printABC()
        }
    
    func testFindNumsAppearOnce() {
        let solution = Solution()
        let result = solution.findNumsAppearOnce([2,4,3,6,3,2,5,5])
        print(result)
    }
    
    func testBuildTree() {
        // 从中序与后序遍历序列构造二叉树
        let solution = Solution()
        let result = solution.buildTree([9,3,15,20,7],[9,15,7,20,3])
        Solution.printTree(result!)
    }
    
    func testFindRightSmall() {
        let solution = Solution()
        let result = solution.findRightSmall([1,2,4,9,4,0,5])
        print(result)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
