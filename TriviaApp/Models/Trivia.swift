//
//  Trivia.swift
//  TriviaApp
//
//  Created by Ari on 08/03/22.
//

import Foundation
import SwiftUI

struct Trivia : Decodable {
    var results : [Result]

    struct Result: Decodable, Identifiable {
        var id : UUID {
            UUID()
        }
        var category : String
        var type : String
        var difficulty : String
        var question : String
        var correctAnswer : String
        var incorrectAnswers : [String]
        
        var formattedQuestions : AttributedString {
            do {
                return try AttributedString(markdown: question)
            } catch{
                print("Error setting formattedQuestion : \(error)")
                return ""
            }
        }
        
        var answers : [Answers] {
            do {
                let correct = [Answers(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                let incorrects = try incorrectAnswers.map { answer in
                    Answers(text: try AttributedString(markdown: answer), isCorrect: false)
                }
                let allAnswers = correct + incorrects
                return allAnswers.shuffled()
            } catch {
                print("Error setting answers: \(error)")
                return[]
            }
        }
    }
}
