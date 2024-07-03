//
//  QuestionDetailView.swift
//  Coding Interview
//
//  Created by BizBrolly on 08/06/24.
//

import SwiftUI
import CodeEditor


struct QuestionDetailView: View {
    @State var question: Questions
    @State private var dynamicHeight: CGFloat = 130
    
    @State var text: String = ""
    @State var toggle = false
    @State private var animatedTexts: [UUID: String] = [:]
    
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: true){
                VStack(alignment: .leading){
                    Text(question.title)
                        .font(.title2)
                    Text(question.description)
                    
                    ForEach(question.solutions, id:\.id){solution in
                        Text(solution.methodType)
                            .font(.headline)
                        Text(solution.description)
                        Text(animatedTexts[solution.id] ?? "")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .padding(10)
                            .background(Color.green.opacity(0.2))
                            .cornerRadius(5)
                            .padding(.bottom, 8)
                    }
                    Spacer()
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            startAnimation()
        }
        
    }
    
    private func startAnimation() {
        for solution in question.solutions {
            animateText(for: solution)
        }
    }
    private func animateText(for solution: Solutions) {
        animatedTexts[solution.id] = ""
        
        for (index, character) in solution.code.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.01) {
                animatedTexts[solution.id, default: ""] += String(character)
            }
        }
    }
}
//
//#Preview {
//    QuestionDetailView()
//}


struct AutoSizingTextEditor: UIViewRepresentable {
    @Binding var text: String
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: AutoSizingTextEditor
        
        init(parent: AutoSizingTextEditor) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.isScrollEnabled = true
        textView.font = UIFont.systemFont(ofSize: 17)
        return textView
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.invalidateIntrinsicContentSize()
    }
}
