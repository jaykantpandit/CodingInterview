//
//  UnionVM.swift
//  Coding Interview
//
//  Created by BizBrolly on 12/06/24.
//

import SwiftUI


class UnionVM: ObservableObject{
    var array1 = [Int]()
    var array2 = [Int]()
    @Published var result = [Int]()
    
    // Using set
    func method1(){
        var unionArray = Set<Int>()
        for i in array1{
            unionArray.insert(i)
        }
        for i in array2{
            unionArray.insert(i)
        }
        
        print(unionArray)
    }
    
    // Using dictionary
    func method2(){
        var union = [Int: Int]()
        for i in array1{
            union[i] = union[i] == nil ? 1 : (union[i] ?? 0)+1
        }
        
        for i in array2{
            union[i] = union[i] == nil ? 1 : (union[i] ?? 0)+1
        }
        
        print(union.keys)
    }
    
    //  Union of Two-Sorted Arrays using
//    Use two index variables i and j, initial values i = 0, j = 0
//    If arr1[i] is smaller than arr2[j] then print arr1[i] and increment i.
//    If arr1[i] is greater than arr2[j] then print arr2[j] and increment j.
//    If both are same then print any of them and increment both i and j.
//    Print remaining elements of the larger array.
    func method3(){
        var union = [Int]()
        array1 = array1.sorted()
        array2 = array2.sorted()
        var i = 0
        var j = 0
        while(i<array1.count && j<array2.count){
            if array1[i] < array2[j]{
                union.append(array1[i])
                i += 1
            }else if array1[i] > array2[j]{
                union.append(array1[j])
                j += 1
            }else{
                union.append(array1[i])
                i += 1
                j += 1
            }
        }
        while(i<array1.count){
            union.append(array1[i])
            i += 1
        }
        while(j<array2.count){
            union.append(array2[j])
            j += 1
        }
        print("Final union result->",union)
    }
}
