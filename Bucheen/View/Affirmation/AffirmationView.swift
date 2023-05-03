//
//  AffirmationView.swift
//  Bucheen
//
//  Created by Abraham Putra Lukas on 28/04/23.
//

import SwiftUI

struct AffirmationView: View {
    var vmAffirm: AffirmationViewModel
    @State private var isAnimating = false
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        Text("Your Partner's Feeling Today")
            .bold()
            .font(.system(size:26))
            .foregroundColor(Color("DarkPurple"))
        Text("Sad")
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.center)
            .padding()
            .frame(width: 100, height: 100)
            .background(Rectangle().fill(Color.white).shadow(radius: 3))
//            .foregroundColor("")
        AffirmationBallView()
        AffirmationListView
            .padding(.bottom, 72)
    }
}

struct AffirmationView_Previews: PreviewProvider {
    static var previews: some View {
        AffirmationView(vmAffirm: AffirmationViewModel())
    }
}

extension AffirmationView {
    
    private var AffirmationListView: some View {
        LazyVGrid(columns: adaptiveColumns) {
            ForEach(0..<constantListOfAffirmation.count, id:\.self) { affirmation in
                VStack{
//                    LottieView(filename: "56301-marriage-couple-hugging", loopMode: .loop, isAnimating: $isAnimating)
//                        .frame(width: 300, height: 300)
                    Button {
                        
                        vmAffirm.addAffirmations(name: constantListOfAffirmation[affirmation], image: constantListOfAffirmation[affirmation]
                )

//                        userEmotionsColor.append(constantListOfEmotionColor[emotion])
                        print(affirmation) //debug
                    } label: {
                        Image(constantListOfAffirmationButton[affirmation])
                            .clipShape(Circle())
                    }
                    Text(constantListOfAffirmation[affirmation])
                        .font(/*@START_MENU_TOKEN@*/.caption2/*@END_MENU_TOKEN@*/)
                }
            }
        }
        .padding()
        .padding(.top)
    }
}