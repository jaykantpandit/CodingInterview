//
//  ModelList.swift
//  Coding Interview
//
//  Created by BizBrolly on 08/06/24.
//

import SwiftUI

struct Questions{
    let id = UUID()
    var title: String
    var description: String = ""
    var solutions: [Solutions]
}

struct Solutions{
    let id = UUID()
    var methodType: String = ""
    var description: String = ""
    var code = ""
}

let questionsData: [Questions] = [
    Questions(
        title: "Reverse a array",
        description: "Reverse a array means if a number is at position 1 then its new position will be Array.length, similarly if a number is at position 2 then its new position will be Array.length – 1, and so on.\nI/P:- [2, 3, 6, 54, 9] \nO/P:- [9, 54, 6, 3,2]",
        solutions: [
            Solutions(methodType: "1. Inbuilt Methods", code: "func method1(){\r\n    result = arr.reversed()\r\n    print(result)\r\n}"),
            Solutions(methodType: "2. Swapping", code: "func method2(){\n        var start = 0\n        var end = arr.count-1\n        while start<end {\n            let temp = arr[start]\n            arr[start] = arr[end]\n            arr[end] = temp\n            start += 1\n            end -= 1\n        }\n    }"),
            Solutions(methodType:"3. Recursion", code: "func method3(){\n        let start = 0\n        let end = elements.count-1\n        reverse(start: start, end: end, arr: &elements)\n        print(elements)\n    }\n    \n    func reverse(start: Int, end: Int, arr: inout [Int]){\n        if start >= end{\n            return\n        }\n        let temp = arr[start]\n        arr[start] = arr[end]\n        arr[end] = temp\n        reverse(start: start+1, end: end-1, arr: &arr)\n    }")
        ]),
    
    Questions(
        title: "Max and Min of an array",
        description: "I/P:- [2, 3, 6, 54, 9] \nO/P:- min: 2, max: 54",
        solutions: [Solutions(code: "func method1(){\n        var min = arr[0]\n        var max = arr[0]\n        for i in arr{\n            if i < min{\n                min = i\n            }else if i > max{\n                max = i\n            }\n        }\n        print(\"min:\\(min)  max:\\(max)\")\n    }\n")]),
    
    Questions(
        title: "Sort an array of 0s, 1s and 2s",
        description: "I/P:- [0, 1, 2, 0, 1, 2}] \nO/P:- [0, 0, 1, 1, 2, 2]",
        solutions: [Solutions(code: " func method1(){\n        var low = 0\n        var high = elements.count-1\n        var mid = 0\n         while mid<=high {\n            if elements[mid] == 0{\n                elements.swapAt(low, mid)\n                low += 1\n                mid += 1\n            }else if elements[mid] == 1{\n                mid += 1\n            }else{\n                elements.swapAt(high, mid)\n                high -= 1\n                \n            }\n        }\n        print(elements)\n    }")]
    ),
    Questions(
        title: "Move all negative numbers to beginning and positive of an array",
        description: "I/P:- [0, 1, 2, 0, 1, 2}] \nO/P:- [0, 0, 1, 1, 2, 2]",
        solutions: [Solutions(code: " func method1(){\n        var low = 0\n        var high = elements.count-1\n        var mid = 0\n         while mid<=high {\n            if elements[mid] == 0{\n                elements.swapAt(low, mid)\n                low += 1\n                mid += 1\n            }else if elements[mid] == 1{\n                mid += 1\n            }else{\n                elements.swapAt(high, mid)\n                high -= 1\n                \n            }\n        }\n        print(elements)\n    }")]
    ),
    Questions(title: "Zig-zag fashion",
              description: "Given an array arr of distinct elements of size n, the task is to rearrange the elements of the array in a zig-zag fashion so that the converted array should be in the below form:\n\narr[0] < arr[1]  > arr[2] < arr[3] > arr[4] < . . . . arr[n-2] < arr[n-1] > arr[n].\n\nNote: Modify the given arr[] only, If your transformation is correct, the output will be 1 else the output will be 0.\n\nInput: n = 7, arr[] = {4, 3, 7, 8, 6, 2, 1}\nOutput: 1\nExplanation:  After modification the array will look like 3 < 7 > 4 < 8 > 2 < 6 > 1, the checker in the driver code will produce 1.",
              solutions: [Solutions(code: "func zigzagFashion(){\n    for i in 0..<elements.count-1{\n        if i%2 == 0{\n            if elements[i] > elements[i+1]{\n                elements.swapAt(i, i+1)\n            }\n        }else{\n            if elements[i] < elements[i+1]{\n                elements.swapAt(i, i+1)\n            }\n        }\n    }\n    print(elements)\n}\n")]
             ),
    Questions(title: "Trapping Rain Water",
              description: "Given an array of N non-negative integers arr[] representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.\nInput: arr[] = {2, 0, 2}\nOutput: 2 \nInput: arr[] = {3, 0, 2, 0, 4}\nOutput: 7",
              solutions: [
                Solutions(
                    methodType:"1. Brute Approach",
                    description: "Traverse every array element and find the highest bars on the left and right sides. Take the smaller of two heights. The difference between the smaller height and the height of the current element is the amount of water that can be stored in this array element. \nTime complexity: O(n^2) ",
                    code: "func getWater(arr: [Int]){\n    var n = arr.count\n    var res = 0\n    for i in 1..<n-1{\n        var lmax = arr[i]\n        // Find the maximum element on its left\n        for j in 0..<i{\n            lmax = max(lmax, arr[j])\n        }\n        var rmax = arr[i]\n\t// Find the maximum element on its right\n        for k in i+1...n-1{\n            rmax = max(rmax, arr[k])\n        }\n        // Update the maximum water\n        res = res + min(lmax, rmax) - arr[i]\n    }\n    print(res)\n}"),
                Solutions(
                    methodType:"2. Precalculation",
                    description: "In previous approach, for every element we needed to calculate the highest element on the left and on the right. \n\nSo, to reduce the time complexity: \n\nFor every element we can precalculate and store the highest bar on the left and on the right (say stored in arrays left[] and right[]). \nThen iterate the array and use the precalculated values to find the amount of water stored in this index, \nwhich is the same as ( min(left[i], right[i]) – arr[i] )\nTime complexity: O(n) ",
                    code: "func getWater(arr: [Int]){\n    var n = arr.count\n    var lmax = [Int](repeating: 0, count: arr.count)\n    var rmax = [Int](repeating: 0, count: arr.count)\n    var res = 0\n    lmax[0] = arr[0]\n    for i in 1..<n{\n        lmax[i] = max(lmax[i-1], arr[i])\n    }\n    rmax[n-1] = arr[n-1]\n    for i in 0...n-2{\n        var k = (n-2)-i\n        rmax[k] = max(rmax[k+1], arr[k])\n    }\n    for i in 0..<n{\n        res = res + min(lmax[i], rmax[i]) - arr[i]\n    }\n    print(res)\n}")
              ]
             ),
    
    Questions(title: "Maximum consecutive 1's in Binary array",
              description: "Given binary array, find count of maximum number of consecutive 1’s present in the array.\nInput  : arr[] = {1, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1}\nOutput : 4\nInput  : arr[] = {0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1}\nOutput : 1",
              solutions: [
                Solutions(
                    methodType:"1. Approach",
                    description: "complexity: O(n^2) ",
                    code: "func maxConsecutiveOnes(arr: [Int]){\n    var n = arr.count\n    var length = 0\n    for i in 0...n-1{\n        var current = 0\n        for j in i...n-1{\n            if arr[j]==1{\n                current += 1\n            }else{\n                break\n            }\n        }\n        length = max(current, length)\n    }\n    print(length)\n}"),
                Solutions(
                    methodType:"2. Approach",
                    description: "Time complexity: O(n) ",
                    code: "func maxConsecutiveOnes(arr: [Int]){\n    var length = 0\n    var current = 0\n    for i in 0...arr.count-1{\n        if arr[i] == 1{\n            current += 1\n            length = max(length, current)\n        }else{\n            current = 0\n        }\n    }\n    print(length)\n}")
              ]
             )
    
    
]
