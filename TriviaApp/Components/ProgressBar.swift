//
//  ProgressBar.swift
//  TriviaApp
//
//  Created by Ari on 08/03/22.
//

import SwiftUI

struct ProgressBar: View {
    var progress : CGFloat
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width : UIScreen.main.bounds.width * 0.9, height: 4)
                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.564,opacity: 0.327))
                .cornerRadius(10)
            Rectangle()
                .frame(width: progress, height: 4)
                .foregroundColor(Color("AccentColor"))
                .cornerRadius(10)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 10)
            .previewDevice("iPhone 12 Pro")
        ProgressBar(progress: 35)
            .previewDevice("iPhone 13 mini")
    }
}
