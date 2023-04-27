//
//  EmotionBallView.swift
//  cobaBucheen
//
//  Created by Jonathan Axel Benaya on 26/04/23.
//

import SwiftUI

struct EmotionBallView: View {
    @Binding var emotionColor : [Color] // Variable for the list color of the user emotion

    
    var body: some View {
        
        VStack {
            //if emotionColor is still empty the ball will be gray
            if emotionColor.isEmpty {
                Circle()
                    .strokeBorder(.gray, lineWidth: 1)
                    .foregroundColor(Color("SuperLightGray"))
                    .frame(width: 223, height: 223)

            } else {
            //if emotionColor is not empty, this list will be used as gradient color in circle
                Circle()
                    .fill(
                        //Stacking the color
                        LinearGradient(gradient: Gradient(
                           colors:emotionColor),
                                       startPoint: .bottom,
                                       endPoint: .top
                        )
                    
                    )
                    .frame(width: 223, height: 223)

            }
        }
        .padding(.vertical)
    }
}
