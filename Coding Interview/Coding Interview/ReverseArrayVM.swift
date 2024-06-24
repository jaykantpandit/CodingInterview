//
//  ReverseArrayVM.swift
//  Coding Interview
//
//  Created by BizBrolly on 30/05/24.
//

import Foundation
import SwiftUI

class ReverseArrayVM: ObservableObject{
    var elements = [Int]()
    @Published var result = [Int]()
    
    // MARK: - Using predefined reversed() method
    func method1(){
        result = elements.reversed()
        print(result)
    }
    
    // MARK: - Print array in revers
    func method2(){
        for i in 0...elements.count-1{
            print(elements[elements.count-1-i])
        }
    }
    
    // MARK: - Swaping
    func method3(){
        var start = 0
        var end = elements.count-1
        while start<end {
            let temp = elements[start]
            elements[start] = elements[end]
            elements[end] = temp
            start += 1
            end -= 1
        }
    }
    
    // MARK: - Recursion Method
    func method4(){
        let start = 0
        let end = elements.count-1
        reverse(start: start, end: end, arr: &elements)
        print(elements)
    }
    
    func reverse(start: Int, end: Int, arr: inout [Int]){
        if start >= end{
            return
        }
        let temp = arr[start]
        arr[start] = arr[end]
        arr[end] = temp
        reverse(start: start+1, end: end-1, arr: &arr)
    }
}
