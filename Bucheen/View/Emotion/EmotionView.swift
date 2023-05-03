//
//  EmotionView.swift
//  cobaBucheen
//
//  Created by Jonathan Axel Benaya on 26/04/23.
//

import SwiftUI


struct EmotionView: View {
    
    @State var userEmotionsColor : [Color] = []
    @State private var segmentedController = "Myself"
    var vm: EmotionViewModel
    @StateObject var vmAffirm = AffirmationViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        ZStack {
            Color("custom_white").ignoresSafeArea()
            VStack{
                Picker("" , selection: $segmentedController) {
                                Text("Myself").tag("Myself")
                                Text("My Partner").tag("My Partner")
                            }
                            .pickerStyle(.segmented)
                            .foregroundColor(Color("DarkBlue"))
                            .font(.caption)
                            .padding(25)
                
                if(segmentedController == "Myself"){
                    Text("Hi, Bro!")
                        .bold()
                        .font(.system(size:26))
                        .foregroundColor(Color("DarkPurple"))
                        .padding(.bottom, 12)// DarkPurple is defined in asset
                    Text("How is your current feeling today?")
//                        .foregroundColor(Color("DarkPurple"))
                    
                    EmotionBallView(emotionColor: $userEmotionsColor)
                    EmotionListView
                        .padding(.bottom, 72)
                } else if (segmentedController == "My Partner"){
                    AffirmationView(vmAffirm: vmAffirm)
                }
            }
            .multilineTextAlignment(.center)
        }
        .onAppear{
            vm.fetchEmotions()
        }
        .onReceive(vm.$listOfEmotions) { _ in
            // Dictionary -> Array , Set, Dictionary
            
            // Closures
            
            // Protocol
            
            //Higher order function
            userEmotionsColor = vm.listOfEmotions.map({ entity in
//                if entity.color != nil{
//                    return entity.color!
//                }
                
                if let color = entity.color{
                    return Color(color)
                }
                return Color("")
            })
        }
    }
}

struct EmotionView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionView(vm: EmotionViewModel())
    }
}

extension EmotionView {
    
    private var EmotionListView: some View {
        LazyVGrid(columns: adaptiveColumns) {
            ForEach(0..<constantListOfEmotion.count, id:\.self) { emotion in
                VStack{
                    Button {
                        vm.addEmotions(name: constantListOfEmotion[emotion], image: constantListOfEmotion[emotion], color: constantListOfEmotion[emotion] + "Color")
                        userEmotionsColor.append(constantListOfEmotionColor[emotion])
//                        print(emotion) //debug
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
