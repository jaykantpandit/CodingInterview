//
//  ZigZagFashion.swift
//  Coding Interview
//
//  Created by BizBrolly on 09/06/24.
//

import Foundation
import SwiftUI

//MARK: - Convert array into Zig-Zag fashion
/*
 Given an array arr of distinct elements of size n, the task is to rearrange the elements of the array in a zig-zag fashion so that the converted array should be in the below form:

 arr[0] < arr[1]  > arr[2] < arr[3] > arr[4] < . . . . arr[n-2] < arr[n-1] > arr[n].

 Note: Modify the given arr[] only, If your transformation is correct, the output will be 1 else the output will be 0.
 
 Input: n = 7, arr[] = {4, 3, 7, 8, 6, 2, 1}
 Output: 1
 Explanation:  After modification the array will look like 3 < 7 > 4 < 8 > 2 < 6 > 1, the checker in the driver code will produce 1.
 */

class ZigZagFashion: ObservableObject{
    var elements = [Int]()
    @Published var result = [Int]()
    
    func zigzagFashion(){
        for i in 0..<elements.count-1{
            if i%2 == 0{
                if elements[i] > elements[i+1]{
                    elements.swapAt(i, i+1)
                }
            }else{
                if elements[i] < elements[i+1]{
                    elements.swapAt(i, i+1)
                }
            }
        }
        print(elements)
    }
}


