//
//  SortArray012.swift
//  Coding Interview
//
//  Created by BizBrolly on 31/05/24.
//

import Foundation
import SwiftUI

// MARK: - Maximum and minimum of an array using minimum number of comparisons

class SortArray012: ObservableObject{
    var elements = [Int]()
    @Published var result = [Int]()
    
    func method1(){
        var low = 0
        var high = elements.count-1
        var mid = 0
        
        print(elements)
        while mid<=high {
            if elements[mid] == 0{
                elements.swapAt(low, mid)
                low += 1
                mid += 1
            }else if elements[mid] == 1{
                mid += 1
            }else{
                elements.swapAt(high, mid)
                high -= 1
                
            }
        }
        print(elements)
    }
}
