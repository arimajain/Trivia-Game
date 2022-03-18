//
//  Answers.swift
//  TriviaApp
//
//  Created by Ari on 08/03/22.
//

import Foundation

struct Answers: Identifiable{
    var id = UUID()
    var text : AttributedString
    var isCorrect : Bool
}
