//
//  IntersectionVM.swift
//  Coding Interview
//
//  Created by BizBrolly on 12/06/24.
//


import SwiftUI

class IntersectionVM: ObservableObject{
    var array1 = [Int]()
    var array2 = [Int]()
    @Published var result = [Int]()
    
    // Using set
    func method1(){
        let array1 = Set(array1)
        let array2 = Set(array2)
       
        print(array1.intersection(array2))
    }
    
   
    func method2(){
        var intersection = [Int]()
        array1 = array1.sorted()
        array2 = array2.sorted()
        var i = 0
        var j = 0
        while(i<array1.count && j<array2.count){
            if array1[i] < array2[j]{
                i += 1
            }else if array1[i] > array2[j]{
                j += 1
            }else{
                intersection.append(array1[i])
                i += 1
                j += 1
            }
        }
        
        print(intersection)
    }
}
