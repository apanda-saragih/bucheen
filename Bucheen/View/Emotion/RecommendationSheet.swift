//
//  RecommendationSheet.swift
//  Bucheen
//
//  Created by Jonathan Axel Benaya on 03/05/23.
//

import SwiftUI

struct RecommendationSheet: View {
    @Binding var currentFeeling : String
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack() {
            Color("custom_white").ignoresSafeArea()
            
            VStack {
                HStack{
                    Spacer()
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color.gray)
                            .background(
                                Circle()
                                    .fill(.white)
                            )
                            .overlay(
                               Circle()
                                    .strokeBorder(Color.gray)
                            )
                    }
                }
                Image(currentFeeling + "Button")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Spacer()
            }
            .padding()
            
            
        }
    }
}

//struct RecommendationSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        RecommendationSheet()
//    }
//}
