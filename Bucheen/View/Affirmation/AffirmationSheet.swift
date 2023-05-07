//
//  AffirmationSheet.swift
//  Bucheen
//
//  Created by Jonathan Axel Benaya on 07/05/23.
//

import SwiftUI

struct AffirmationSheet: View {
    @Binding var currentAffirmation : String

    @AppStorage("partner_code") var partnerCode: String?
    
    var vmAffirm : AffirmationViewModel
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
//                Image(currentAffirmation)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 200, height: 200)
                
                LottieView(name: currentAffirmation, loopMode: .loop)
                Text(currentAffirmation)
            }
            .padding()
            
            
        }
        .onAppear{
        }
    }
}
//
//struct AffirmationSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        AffirmationSheet(currentAffirmation: Binding.constant("Hugs"))
//    }
//}
