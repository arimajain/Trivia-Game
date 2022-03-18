//
//  ContentView.swift
//  TriviaApp
//
//  Created by Ari on 07/03/22.
//

import SwiftUI



struct ContentView: View {
    @StateObject var triviaManager = TriviaManager(url: "https://opentdb.com/api.php?amount=10&type=multiple")
    
    var body: some View {
        
        NavigationView {
            ZStack{
                Color("background")
                    .edgesIgnoringSafeArea(.all)
              VStack{
                  VStack{
                      Text("Trivia Game")
                          .font(.system(size: 35, weight: .heavy))
                          .foregroundColor(Color("AccentColor"))
                          .multilineTextAlignment(.center)
                      Text("Are you ready to test out your trivia skills?")
                          .multilineTextAlignment(.center)
                          .padding([.top, .leading, .trailing], 5.0)
                          .foregroundColor(Color("AccentColor"))
                          .font(.system(size: 20, weight: .medium))
                      
                  }
                  NavigationLink{
                      TriviaView()
                          .environmentObject(triviaManager)
                  }label: {
                      PrimaryButton(text: "Let's go!", background: Color("AccentColor"))
                          .padding(.top, 35.0)
                          .font(.system(size: 20, weight: .semibold))
                  }
                  

                }
           
            }
            .navigationBarTitleDisplayMode(.inline)
        }
         
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
            .previewDevice("iPhone 12 Pro Max")
        ContentView()
            .previewDevice("iPhone SE (2nd generation)")
        
    }
}
