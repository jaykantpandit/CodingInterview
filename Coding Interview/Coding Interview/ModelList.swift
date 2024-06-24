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
    )
]
