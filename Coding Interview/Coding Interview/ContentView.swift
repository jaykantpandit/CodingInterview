//
//  ContentView.swift
//  Coding Interview
//
//  Created by BizBrolly on 30/05/24.
//

import SwiftUI

struct ContentView: View {
//    var reverseArrayVM = ReverseArrayVM()
    var minMaxArrayVM = MinMaxInArray()
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
            minMaxArrayVM.elements = [-2, 1, -4, 5, 3]
            minMaxArrayVM.method1()
        }
    }
}

#Preview {
    ContentView()
}
