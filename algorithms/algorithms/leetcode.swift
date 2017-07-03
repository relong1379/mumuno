//
//  leetcode.swift
//  algorithms
//
//  Created by 李晓东 on 2017/6/10.
//  Copyright © 2017年 XD. All rights reserved.
//

import Cocoa

class leetcode: NSObject {
    
    
    /*
     Given an array and a value, remove all instances of that > value in place and return the new length.
     The order of elements can be changed. It doesn't matter what you leave beyond the new length
     
     给定数组，移除数组内的目标值，并返回数组长度
     */
    public class func removeElment(array: inout [Int], n: Int, elem: Int) -> Int {
        /*
         eg
         [1,2,2,4,5] target=2
         
         step1:[1,2,2,4,5] i=0 j=0
         step2:[1,2,2,4,5] i=1 j=0
         step3:[1,2,2,4,5] i=2 j=0
         step4:[1,4,2,4,5] i=3 j=1
         step5:[1,4,5,4,5] i=4 j=2
         
         思路:
         1. 对给定数组进行循环，j 用于记录不重复值个数
         2. 元素i 与目标值相等时，循环继续走，不相等时 j自增，同时将此时i 元素的值赋给 j 元素上
         3. 移除超过 j 值的元素
         */
        var j = 0
        var i = 0
        while i < n {
            if array[i] != elem {
                array[j] = array[i]
                j+=1
            }
            i+=1
            print(array)
        }
        array.removeLast(n - j)
        print(array)
        return j
    }
    
    /*
     Given a sorted array, remove the duplicates in place such that > each element appear only once
     and return the new length.
     Do not allocate extra space for another array, you must do this in place with constant memory.
     For example, Given input array A = [1,1,2],
     Your function should return length = 2, and A is now [1,2].
     
     给定排序好的数组，移除重复项，只有一种重复值，返回去重后数组的个数
     ps:不能开辟新的空间
     
     思路：
     1.两个下标 i和j ，i 用于循环自增，j 用于记录非重复值的个数
     2.当 i元素与 j元素不相同时，j 自增，同时将 i元素赋值给 j元素
     
     步骤
     [1, 4, 4, 6, 7, 8] i-- 1 j-- 1
     [1, 4, 4, 6, 7, 8] i-- 2 j-- 1
     [1, 4, 6, 6, 7, 8] i-- 3 j-- 2
     [1, 4, 6, 7, 7, 8] i-- 4 j-- 3
     [1, 4, 6, 7, 8, 8] i-- 5 j-- 4
     */
    public class func removeDupliteFromSortedArray(array: inout [Int]) -> Int {
        if (array.count == 0) {
            return 0
        }
        var j = 0
        for i in 1...(array.count - 1) {
            if array[i] != array[j] {
                j+=1
                array[j] = array[i]
            }
            print(array,"i--",i,"j--",j)
        }
        array.removeLast(array.count-j-1)
        return j+1
    }
    
    /*
     Follow up for "Remove Duplicates": What if duplicates are allowed at most twice?
     For example, Given sorted array A = [1,1,1,2,2,3],
     Your function should return length = 5, and A is now [1,1,2,2,3].
     
     还是给定排序好的数组，移除重复项，不同的是有重复的次数不能超过2
     */
    
    public class func removeMultipDupliteFromSortedArray(array: inout [Int]) -> Int {
        if array.count == 0 {
            return 0
        }
        var num = 0
        var j = 0
        for i in 1...(array.count - 1) {
            if array[j] == array[i] {
                num += 1
                if num < 2 {
                    j += 1
                    array[j] = array[i]
                }
            } else {
                j+=1
                array[j] = array[i]
                num = 0
            }
            print(array)
        }
        array.removeLast(array.count-j-1)
        print(array)
        return j+1
    }
    
    /*
     Given a non-negative number represented as an array of digits, plus one to the number.
     The digits are stored such that the most significant digit is at the head of the list.
     
     这道题的意思是将数组看成一个数然后进行加一操作,需要考虑的就是尾数为9 要进位
     
     思路：
     对给定的数组进行逆序循环，然后逐个加1 ，为9则将该位置为0
     如果第一位为9，需要在首位插入1
     */
    
    public class func plusOne(array: inout [Int]) -> [Int]{
        let n = array.count
        if n == 0 {
            return [Int]()
        }
        for i in (0...n-1).reversed() {
            if array[i] < 9 {
                array[i] += 1
                return array
            }
            array[i] = 0
        }
        array.insert(1, at: 0)
        return array
    }
    
    /*
     Given numRows, generate the first numRows of Pascal's triangle.
     For example, given numRows = 5, Return
     
     [
     [1]
     [1, 1]
     [1, 2, 1]
     [1, 3, 3, 1]
     [1, 4, 6, 4, 1]
     [1, 5, 10, 10, 5, 1]
     [1, 6, 15, 20, 15, 6, 1]
     [1, 7, 21, 35, 35, 21, 7, 1]
     ]
     要得到一个帕斯卡三角，我们只需要找到规律即可。
     第k层有k个元素
     每层第一个以及最后一个元素值为1
     对于第k（k > 2）层第n（n > 1 && n < k）个元素A[k][n]，A[k][n] = A[k-1][n-1] + A[k-1][n]
     
     
     */
    public class func generatePascaltriangle(row: Int) -> [[Int]] {
        if row <= 0 {
            return [[Int]]()
        }
        var array = [[Int]]()
        for i in 1...row {
            var sub = [Int]()
            for j in 0...i-1 {
                if j == 0 || (j > 0 && j == i-1){
                    sub.append(1)
                } else {
                    let before = array[i-2]
                    sub.append(before[j]+before[j-1])
                    //print("i--",i,"j---j",before)
                }
            }
            array.append(sub)
            print(sub)
        }
        return array
    }
    
    
    /*
     Given an index k, return the kth row of the Pascal's triangle.
     For example, given k = 3, Return [1,3,3,1].
     
     帕斯卡三角II 与上面不同的是不需要返回从1到n的所有数组，只要n对应的数组
     
     以下是我比较偷懒的做法啦
     */
    
    public class func generatePascalTriangleII(_ row: Int) -> [Int] {
        if row <= 0 {
            return [Int]()
        }
        var array = [[Int]]()
        for i in 1...row {
            var sub = [Int]()
            for j in 0...i-1 {
                if j == 0 || (j > 0 && j == i-1){
                    sub.append(1)
                } else {
                    let before = array[i-2]
                    sub.append(before[j]+before[j-1])
                    //print("i--",i,"j---j",before)
                }
            }
            array.append(sub)
            print(sub)
        }
        return array[row-1]
    }
    
    /*
     Given two sorted integer arrays A and B, merge B into A as one sorted array.
     Note: You may assume that A has enough space (size that is greater or equal to m + n) to hold
     additional elements from B. The number of elements initialized in A and B are m and n respectively.
     
     合并两个已经排序好的数组 返回新的排序数组
     
     题解：如果这题用swift来做的话，直接用高阶函数sorted 就好了>_<
     但是
     */
    
    public class func mergeSortedArray(array1: [Int], array2: [Int]) -> [Int] {
        var array = [Int]()
        if array1.count == 0 && array2.count == 0 {
            return array
        }
        // SolutionI O(1)
        //array.append(contentsOf: array1)
        //array.append(contentsOf: array2)
        //return array.sorted()
        
        // Solution II O(n)
        var n = array1.count + array2.count - 1
        var i = array1.count - 1
        var j = array2.count - 1
        while n >= 0{
            if i >= 0 && j >= 0 {
                if array1[i] > array2[j] {
                    array.insert(array1[i], at: 0)
                    i -= 1
                } else {
                    array.insert(array2[j], at: 0)
                    j -= 1
                }
            } else if j >= 0 {
                array.insert(array2[j], at: 0)
                j -= 1
            } else if i >= 0 {
                array.insert(array1[i], at: 0)
                i -= 1
            }
            
            n -= 1
        }
        return array
    }
    
    /*
     2 Sum
     
     Given an array of intergers, find two numbers such that they add up to a specific target number. The
     function twoSum should return indices of the two numbers such that they add up to the target,
     where index1 must be less than index2 Please note that your returned answers (both index1 and
     index2) are not zero-based.
     You may assume that each input would have exactly one solution.
     Input: numbers={2, 7, 11, 15}, target=9 Output: index1=1, index2=2
     
     题意是给定一个数组和一个值，让求出这个数组中两个值的和等于这个给定值的下标，输出是有要求的
     1.下标较小的在前面，下标不能为0
     2.假设数组中至少有一组值的和等于给定值
     这是多数求和的第一题，后面还有 3Sum、4Sum等，解题思路是相似的
     */
    
    public class func twoSumSolution(_ array: [Int], _ target: Int) -> [Int]{
        var indexes = [Int]()
        if array.count == 0  {
            return indexes
        }
        
        //Solution I
//        for i in 0...array.count-1 {
//            let a = array[i]
//            for j in i...array.count-1 {
//                if j == array.count-1 {
//                    continue
//                }
//                let b = array[j+1]
//                if a+b==target {
//                    indexes.append(i+1)
//                    indexes.append(j+1)
//                    print("a---\(a)b---\(b)")
//                }
//            }
//        }
//        return indexes
        
        //Solution II 这个解法就是利用hash 的特性将时间复杂度从O(n^2) 降到 O(n)
        
        var dic = [Int:Int]()
        var index = 0
        for num in array {
            let a = target - num
            if dic.keys.contains(num) {
                indexes.append(dic[num]! + 1)
                indexes.append(index + 1)
            } else {
                dic[a] = index
            }
            index += 1
        }
        return indexes
    }
    
    public class func findMinimunNumInRotateArray(_ array: [Int]) -> Int {
        if array.count == 0 {
            return 0
        } else if array.count == 1 {
            return array[0]
        } else if array.count == 2 {
            return min(array[0], array[1])
        }
        
        var start = 0
        var stop = array.count - 1
        while start < stop-1 {
            if array[start] < array[stop] {
                return array[start]
            }
            
            let mid = start + (stop - start)/2
            if array[mid] > num[start] {
                start = mid
            } else if array[mid] < array[start] {
                stop = mid
            }
        }
        return min(array[start], array[stop])
    }
    
    
    /*
     https://oj.leetcode.com/problems/longest-substring-without-repeating-characters/
     #3 Longest Substring Without Repeating Characters
     Level: medium
     Given a string, find the length of the longest substring without repeating characters. For example, the longest substring without repeating letters for "abcabcbb" is "abc", which the length is 3. For "bbbbb" the longest substring is "b", with the length of 1.
     Inspired by @heiyanbin at https://oj.leetcode.com/discuss/6168/my-o-n-solution
     
     在一串字符串中去掉重复的字符，同时返回去重后的字符长度
     题解步骤
     1. 将sting的字符与下标保存到map中
     2. 如果map中有过当前字符，这里要注意的是map中的有可能首元素是否重复的问题所以需要多判断一步
     3. 如果没有该字符，max 和 tmpMax 同时加1
     
     temp 2 maxl 2 ["b": 1, "a": 0]
     temp 3 maxl 3 ["b": 1, "a": 0, "c": 2]
     temp 3 maxl 3 ["b": 1, "a": 3, "c": 2]
     temp 1 maxl 3 ["b": 1, "a": 4, "c": 2]
     temp 2 maxl 3 ["b": 5, "a": 4, "c": 2]
     temp 1 maxl 3 ["b": 6, "a": 4, "c": 2]
     temp 2 maxl 3 ["b": 6, "a": 4, "d": 7, "c": 2]
     */

    struct Medium_003_Longest_Substring_Without_Repeating_Characters {
        // t = O(N), s = O(1)
        static func longest(_ s: String) -> Int {
            let charArr = s.randomAccessCharactersArray()
            let len = charArr.count
            if len <= 1 {
                return len
            } else {
                var tmpMaxLen = 1
                var maxLen = 1
                var hashMap = Dictionary<Character, Int>()
                hashMap[charArr[0]] = 0
                for i in 1..<len {
                    if let lastPosition = hashMap[charArr[i]] {
                        if lastPosition < i - tmpMaxLen {
                            tmpMaxLen += 1//用于记录 单个字符重复次数
                        } else {
                            tmpMaxLen = i - lastPosition
                        }
                    } else {
                        tmpMaxLen += 1
                    }
                    hashMap[charArr[i]] = i
                    if tmpMaxLen > maxLen {
                        maxLen = tmpMaxLen
                    }
                    print("i",i,"temp",tmpMaxLen,"maxl",maxLen,hashMap)
                }
                return maxLen+1
            }
        }
    }
}

private extension String {
    /*
     Ref: http://oleb.net/blog/2014/07/swift-strings/
     "Because of the way Swift strings are stored, the String type does not support random access to its Characters via an integer index — there is no direct equivalent to NSStringʼs characterAtIndex: method. Conceptually, a String can be seen as a doubly linked list of characters rather than an array."
     
     By creating and storing a seperate array of the same sequence of characters,
     we could hopefully achieve amortized O(1) time for random access.
     */
    func randomAccessCharactersArray() -> [Character] {
        return Array(self.characters)
    }
}
