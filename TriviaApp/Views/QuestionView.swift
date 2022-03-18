//
//  QuestionView.swift
//  TriviaApp
//
//  Created by Ari on 08/03/22.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager : TriviaManager
    
    var body: some View {
        ZStack{
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    HStack{
                          Text("Trivia Game")
                              .font(.system(size: 35, weight: .heavy))
                              .foregroundColor(Color("AccentColor"))
                        Spacer()
                        
                        Text("\(triviaManager.index + 1) out of \(triviaManager.length)")
                              .fontWeight(.heavy)
                              .foregroundColor(Color("AccentColor"))
                        }
                    ProgressBar(progress: triviaManager.progress)
                        .padding(.top)
                    
                    VStack {
                        Text(triviaManager.question)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 40.0)
                            .padding(.bottom, 15.0)
                            .frame(width : UIScreen.main.bounds.width * 0.9)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(/*@START_MENU_TOKEN@*/Color(hue: 1.0, saturation: 0.003, brightness: 0.324)/*@END_MENU_TOKEN@*/)
                        
                        ForEach(triviaManager.answerChoices, id: \.id) {
                            answer in
                            AnswerRow(answer: answer)
                                .environmentObject(triviaManager)
                                .frame(width: UIScreen.main.bounds.width * 0.9, height: 75.0)
                                .environmentObject(triviaManager)
                        }
        
                    }
                    Button{
                        triviaManager.goToNextQuestion()
                    } label: {
                        PrimaryButton(text: "Next", background: triviaManager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                            .padding(.top, 40.0)
                        
                    } .disabled(!triviaManager.answerSelected)
                   
                  
                }

            }.padding([.top, .leading, .trailing], 15.0)
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager(url: ""))
            .previewDevice("iPhone 12 Pro Max")
        QuestionView()
            .environmentObject(TriviaManager(url: ""))
            .previewDevice("iPhone SE (2nd generation)")
    }
}
