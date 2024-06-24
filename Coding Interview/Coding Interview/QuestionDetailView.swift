//
//  QuestionDetailView.swift
//  Coding Interview
//
//  Created by BizBrolly on 08/06/24.
//

import SwiftUI

struct QuestionDetailView: View {
    @State var question: Questions
    @State var text: String = ""
    @State var toggle = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: true){
                VStack(alignment: .leading){
                    Text(question.title)
                        .font(.title3)
                    Text(question.description)
                    ForEach(question.solutions, id:\.id){solution in
                        Text(solution.methodType)
                            .font(.headline)
                        Text(solution.description)
            
                        Text(text)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .padding(10)
                            .background(Color.green.opacity(0.2))
                            .cornerRadius(5)
                            .padding(.bottom, 8)
                            .onAppear {
                                solution.code.enumerated().forEach { index, character in
                                    DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.01) {
                                      text += String(character)
                                    }
                                  }
                            }
                    }
                        
                    Spacer()
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
}
//
//#Preview {
//    QuestionDetailView()
//}
