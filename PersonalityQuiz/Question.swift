//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Christopher Lamm on 12/18/23.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, range
}
