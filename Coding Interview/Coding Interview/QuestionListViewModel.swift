//
//  QuestionListViewModel.swift
//  Coding Interview
//
//  Created by BizBrolly on 22/06/24.
//

import SwiftUI

class QuestionListViewModel: ObservableObject{
    @Published var questionList = questionsData
}
