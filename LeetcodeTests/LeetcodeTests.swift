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
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
