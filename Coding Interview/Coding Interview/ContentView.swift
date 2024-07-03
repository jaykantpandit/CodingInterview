//
//  ContentView.swift
//  Coding Interview
//
//  Created by BizBrolly on 30/05/24.
//

import SwiftUI

struct ContentView: View {
        var testVM = TestVM()
    //    var minMaxArrayVM = MinMaxInArray()
    //    var sort012 = SortArray012()
//    var zigzag = ZigZagFashion()
    var unionVM = UnionVM()
    var intersectionVM = IntersectionVM()
    var rotation = ArrayRotationVM()
    
    @StateObject var questionsVM = QuestionListViewModel()
    var negativePositive = NegativeOnSideVM()
    var body: some View {
        NavigationView{
            VStack{
                
                List(questionsVM.questionList, id: \.id) { question in
                    NavigationLink(question.title) {
                        QuestionDetailView(question: question)
                    }
                }
                .navigationTitle("Questions")
                .navigationBarTitleDisplayMode(.large)
            }
        }
        .onAppear {
            testVM.aa(arr: [1,1,0,0,0,0,1,0,0])
            //            reverseArrayVM.elements = [4,6,2,90,66,55,22,1]
            //            reverseArrayVM.method4()
            //            minMaxArrayVM.elements = [-2, 1, -4, 5, 3]
            //            minMaxArrayVM.method1()
            
//            negativePositive.elements = [-12, 11, -13, -2, 30, 22, -4]
//            negativePositive.method2()
//            zigzag.elements = [4, 3, 7, 8, 6, 2, 1]
//            zigzag.zigzagFashion()
            
//            unionVM.array1 = [1,2,3, 4, 5, 6]
//            unionVM.array2 = [3,5,8,9, 12]
////            unionVM.method3()
//            
//            intersectionVM.array1 = [4, 3, 7, 8, 6, 2, 1]
//            intersectionVM.array2 = [11, 7, 10, 6, 2, 1]
//            intersectionVM.method1()
//            rotation.elements = [1,2,3]
//            rotation.numberOfRotation = 3
//            rotation.method2()

        }
    }
}

#Preview {
    ContentView()
}
