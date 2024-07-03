//
//  TestVM.swift
//  Coding Interview
//
//  Created by BizBrolly on 30/05/24.
//


import SwiftUI

class TestVM: ObservableObject{
    
    // MARK: - Using predefined reversed() method
    func maxConsecutiveOnes(arr: [Int]){
        var n = arr.count
        var length = 0
        for i in 0...n-1{
            var current = 0
            for j in i...n-1{
                if arr[j]==1{
                    current += 1
                }else{
                    break
                }
            }
            length = max(current, length)
        }
        print(length)
    }
    
    func aa(arr:[Int]){
        var length = 0
        var current = 0
        for i in 0...arr.count-1{
            if arr[i] == 1{
                current += 1
                length = max(length, current)
            }else{
                current = 0
            }
        }
        print(length)
    }
}

func aa(arr:[Int]){
    var length = 0
    var current = 0
    for i in 0...arr.count-1{
        if arr[i] == 1{
            current += 1
            length = max(length, current)
        }else{
            current = 0
        }
    }
    print(length)
}

