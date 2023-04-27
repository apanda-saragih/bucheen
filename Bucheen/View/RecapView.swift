//
//  RecapView.swift
//  cobaBucheen
//
//  Created by Jonathan Axel Benaya on 26/04/23.
//

import SwiftUI

struct RecapView: View {
    
    @StateObject var vm = EmotionViewModel()
    
    var body: some View {
        VStack {
            List{
                ScrollView{
                    ForEach(vm.listOfEmotions, id: \.self) { emotion in
                        VStack(alignment : .leading) {
                            Text(emotion.name ?? "NO EMOTION")
                            Text(emotion.image ?? "NO IMAGE")
                            Text(emotion.color ?? "NO COLOR")
                            Text(emotion.time?.formatted() ?? "NO TIME")
                        }
                        .padding()
                        .onAppear {
                            print(vm.listOfEmotions.count)
                        }
                    }
                }

            }
        }
        
    }
}

struct RecapView_Previews: PreviewProvider {
    static var previews: some View {
        RecapView()
    }
}
