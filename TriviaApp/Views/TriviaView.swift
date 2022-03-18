//
//  TriviaView.swift
//  TriviaApp
//
//  Created by Ari on 08/03/22.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager : TriviaManager
    
    var body: some View {
      if triviaManager.reachedEnd {
            ZStack{
                Color("background")
                VStack{
                    Text("Trivia Game")
                            .font(.system(size: 35, weight: .heavy))
                            .foregroundColor(Color("AccentColor"))
                            .multilineTextAlignment(.center)
                    Text("Congratulations, you completed the game 🥳 ")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("AccentColor"))
                        .font(.system(size: 17, weight: .medium))
                        .padding(.top, 1.0)
                        .padding(.horizontal, 8.0)
                    Text("You scored \(triviaManager.score) out of \(triviaManager.length)")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("AccentColor"))
                        .font(.system(size: 19, weight: .medium))
                        .padding(.top)
                       
                    Button{
                        Task.init {
                            await triviaManager.fetchTrivia(url: "https://opentdb.com/api.php?amount=10&type=multiple")
                        }
                    } label: {
                        PrimaryButton(text: "Play Again")
                    }
                    .padding(.top)
                    
                }
            
            }
            .ignoresSafeArea(.all)
        }
    else {
        
       QuestionView()
          .environmentObject(triviaManager)
    }
}
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager(url: ""))
    }
}
