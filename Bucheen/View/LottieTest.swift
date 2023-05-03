//
//  LottieTest.swift
//  Bucheen
//
//  Created by Abraham Putra Lukas on 03/05/23.
//

import SwiftUI

struct LottieTest: View {
    @State private var isAnimating = false
    var lottie = LottieView(name: "56301-marriage-couple-hugging", loopMode: .loop)
    @State private var showingLottie = false

    var body: some View {
        VStack{
            if showingLottie {
                lottie
            }
            Button {
                showLottie()
//                if isAnimating == false {
//                    lottie.onTapGesture {
//                        isAnimating.toggle()
//                    }
//                }
//                isAnimating == true
            } label: {
                Text("Hehe")
            }

        }
    }
    
    private func showLottie() {
        self.showingLottie = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showingLottie = false
        }
    }
}

struct LottieTest_Previews: PreviewProvider {
    static var previews: some View {
        LottieTest()
    }
}
