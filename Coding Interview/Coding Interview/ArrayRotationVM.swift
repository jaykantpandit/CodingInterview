//
//  ArrayRotationVM.swift
//  Coding Interview
//
//  Created by BizBrolly on 14/06/24.
//


import SwiftUI

class ArrayRotationVM: ObservableObject{
    var elements = [Int]()
    var numberOfRotation = 1
    
    func method1(){
        var numberOfRotation = numberOfRotation%elements.count
        
        while numberOfRotation>0{
            let atZero = elements[0]
            for j in 0...elements.count-2{
                elements[j] = elements[j+1]
            }
            elements[elements.count-1] = atZero
            numberOfRotation -= 1
        }
        print(elements)
    }
    
    func method2(){
        let numberOfRotation = numberOfRotation%elements.count
        
        var finalRotatedArray = [Int]()
        for j in 0...elements.count-1{
            let tempPosition = j-numberOfRotation
            let newPosition = tempPosition < 0 ? elements.count+tempPosition : tempPosition
            finalRotatedArray.append(elements[newPosition])
        }
        print(finalRotatedArray)
    }
    
}
