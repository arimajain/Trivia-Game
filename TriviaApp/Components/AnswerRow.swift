//
//  AnswerRow.swift
//  TriviaApp
//
//  Created by Ari on 08/03/22.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var triviaManager : TriviaManager
    
    var answer : Answers
    @State private var isSelected = false
    
    var body: some View {
        ZStack{
            Color("background")
                .edgesIgnoringSafeArea(.all)
          ZStack{
            Rectangle()
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 60, alignment: .leading)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: isSelected ? (answer.isCorrect ? .green : .red): .gray, radius: 8, x: 0.8, y: 0.8)
                
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundColor(triviaManager.answerSelected ? (isSelected ? Color("AccentColor"): .gray) : Color("AccentColor")) 
                    .font(.caption)
                   
                    
                
                Text(answer.text)
                    .fontWeight(.semibold)
                    .foregroundColor(isSelected ? Color("AccentColor") : .gray)
                
                if isSelected {
                    
                    Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                        .foregroundColor(answer.isCorrect ? .green : .red)
                        .padding(.trailing, 30.0)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.leading, 40.0)
              
        }
          .onTapGesture {
              if !triviaManager.answerSelected{
                  isSelected = true
                  triviaManager.selectAnswer(answer: answer)
              }
            }
                
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answers(text: "True", isCorrect: false))
            .environmentObject(TriviaManager(url: ""))
            .previewDevice("iPhone 12 Pro")
        AnswerRow(answer: Answers(text: "True", isCorrect: false))
            .environmentObject(TriviaManager(url: ""))
            .previewDevice("iPhone SE (2nd generation)")
    }
}
