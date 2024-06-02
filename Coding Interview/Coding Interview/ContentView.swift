//
//  ContentView.swift
//  Coding Interview
//
//  Created by BizBrolly on 30/05/24.
//

import SwiftUI

struct ContentView: View {
//    var reverseArrayVM = ReverseArrayVM()
//    var minMaxArrayVM = MinMaxInArray()
//    var sort012 = SortArray012()
    var negativePositive = NegativeOnSideVM()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("____!")
                .font(.largeTitle)
                .fontWeight(.heavy)
                
        }
        .padding()
        .task {
//            reverseArrayVM.elements = [4,6,2,90,66,55,22,1]
//            reverseArrayVM.method4()
//            minMaxArrayVM.elements = [-2, 1, -4, 5, 3]
//            minMaxArrayVM.method1()
            
            negativePositive.elements = [-12, 11, -13, -2, 30, 22, -4]
            negativePositive.method2()
        }
    }
}

#Preview {
    ContentView()
}
