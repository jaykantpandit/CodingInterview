//
//  MinMaxInArray.swift
//  Coding Interview
//
//  Created by BizBrolly on 31/05/24.
//

import Foundation
import SwiftUI

// MARK: - Maximum and minimum of an array using minimum number of comparisons

class MinMaxInArray: ObservableObject{
    var elements = [Int]()
    @Published var minimum = Int()
    @Published var maximum = Int()
    
    func method1(){
        var min = elements[0]
        var max = elements[0]
        for i in elements{
            if i < min{
                min = i
            }else if i > max{
                max = i
            }
        }
        print("min:\(min)  max:\(max)")
    }
    
}
