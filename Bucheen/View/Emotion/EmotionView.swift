//
//  EmotionView.swift
//  cobaBucheen
//
//  Created by Jonathan Axel Benaya on 26/04/23.
//

import SwiftUI


struct EmotionView: View {
    @StateObject var vm = EmotionViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        ZStack {
            Color("custom_white").ignoresSafeArea()
            
            VStack{
                Text("Input Your Current Feelings!")
                    .bold()
                    .font(.system(size:26))
                    .foregroundColor(Color("DarkPurple")) // DarkPurple is defined in asset
                
                EmotionBallView(emotionColor: vm.getColorFromEmotions())
                EmotionListView
            }
            .multilineTextAlignment(.center)
        }
    }
}

struct EmotionView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionView()
    }
}

extension EmotionView {
    
    private var EmotionListView: some View {
        LazyVGrid(columns: adaptiveColumns) {
            ForEach(0..<constantListOfEmotion.count, id:\.self) { emotion in
                VStack{
                    Button {
                        vm.addEmotions(name: constantListOfEmotion[emotion], image: constantListOfEmotion[emotion], color: constantListOfEmotion[emotion] + "Color")
                        print(emotion) //debug
                    } label: {
                        Image(constantListOfButton[emotion])
                            .clipShape(Circle())
                    }
                    Text(constantListOfEmotion[emotion])
                        .font(/*@START_MENU_TOKEN@*/.caption2/*@END_MENU_TOKEN@*/)
                }
            }
        }
        .padding()
        .padding(.top)
    }
}

