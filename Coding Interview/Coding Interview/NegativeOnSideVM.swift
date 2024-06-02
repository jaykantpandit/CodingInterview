//
//  NegativeOnSideVM.swift
//  Coding Interview
//
//  Created by BizBrolly on 02/06/24.
//

import Foundation
import SwiftUI

//MARK: - Move all negative numbers to beginning and positive to end with constant extra space
class NegativeOnSideVM: ObservableObject{
    var elements = [Int]()
    @Published var result = [Int]()
        
    func method1(){
        var j = 0;
        for i in 0...elements.count-1 {
            if (elements[i] < 0) {
                if (i != j){
                    elements.swapAt(i, j)
                }
                j += 1
            }
        }
        print(elements)
    }
    
    func method2(){
        var left = 0
        var right = elements.count - 1
        while (left < right){
            // Condition to check if the left
            // and the right elements are
            // negative
            if elements[left] < 0{
                left += 1
            }
            // Condition to check if the left
            // pointer element is positive and
            // the right pointer element is negative
            else if (elements[right] > 0){
                right -= 1
            }
            // Condition to check if both the
            // elements are positive
            else{
                elements.swapAt(left, right)
            }
        }
        print(elements)
    }
}
