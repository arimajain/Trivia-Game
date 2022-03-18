//
//  primaryButton.swift
//  TriviaApp
//
//  Created by Ari on 07/03/22.
//

import SwiftUI

struct PrimaryButton: View {
    var text : String
    var background : Color = Color("AccentColor")
    
    var body: some View {
        ZStack{
            Text(text)
                .foregroundColor(.white)
                .padding(.all)
                .padding(.horizontal)
                .background(background)
                .cornerRadius(50)
                .shadow(radius: 10)
        }
    }
}

struct primaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Next")
            .previewDevice("iPhone 12 Pro")
        PrimaryButton(text: "Next")
            .previewDevice("iPhone 12 Pro Max")
    }
}

