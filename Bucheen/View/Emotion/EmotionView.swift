//
//  EmotionView.swift
//  cobaBucheen
//
//  Created by Jonathan Axel Benaya on 26/04/23.
//

import SwiftUI


struct EmotionView: View {
    
    @AppStorage("name") var name : String?
    
    @State var userEmotionsColor : [Color] = []
    @State private var segmentedController = "Myself"
    @State var currentFeeling : String = ""
    @State var showRecommendationSheet : Bool = false
   
    @StateObject var vmAffirm = AffirmationViewModel()
    
    
    var vm: EmotionViewModel
    
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
                            .padding(10)
                            .padding(.horizontal)
                
                if(segmentedController == "Myself"){
                    Text("Hi, " + (name ?? "User") + "!")
                        .bold()
                        .font(.system(size:26))
                        .foregroundColor(Color("DarkPurple"))
                        .padding(.bottom, 12)// DarkPurple is defined in asset
                Text("How is your current feeling today?")
                        .padding(.bottom)
                Text(currentFeeling)
                        .font(.headline)
                        .frame(minWidth: 100)
                        .padding()
                        .background(Color("super_light_gray"))
                        .cornerRadius(5)
                        
                        
//                        .foregroundColor(Color("DarkPurple"))
                    
                    EmotionBallView(emotionColor: $userEmotionsColor)
                    Button {
                        showRecommendationSheet.toggle()
                    } label: {
                        HStack{
                            Image(systemName: "lightbulb")
                                .foregroundColor(Color("dark_purple"))
                            Text("Here's some recommendations for you")
                                .foregroundColor(Color("dark_purple"))
                                .underline()
                        }
                        
                    }
                    .fullScreenCover(isPresented: $showRecommendationSheet) {
                        RecommendationSheet(currentFeeling: $currentFeeling)
                    }

                    
                    EmotionListView
                        .padding(0)
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
            
            let listEntity = vm.listOfEmotions.filter({ entity in
                if let time = entity.time {
                    let calendar = Calendar.current
                    let dateData = calendar.dateComponents([.year,.month,.day], from: time)
                    let today = calendar.dateComponents([.year,.month,.day], from: Date.now)
                    return dateData.year == today.year &&
                    dateData.month == today.month &&
                    dateData.day == today.day
                }
                return false
            })
            
            if listEntity.isEmpty {
                currentFeeling = "No Feeling"
            } else {
                currentFeeling = listEntity[listEntity.count-1].name ?? "No Feeling"
            }
            
        //Get ColorEntity
            userEmotionsColor  = listEntity.map({ entity in
                if let color = entity.color{
                    return Color(color)
                }
                return Color("HappyEmotion")
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
                        
                        vm.addEmotions(
                            user: (name ?? "User"),
                            name: constantListOfEmotion[emotion],
                            image: constantListOfEmotion[emotion],
                            color: constantListOfEmotion[emotion] + "Color")
                        userEmotionsColor.append(constantListOfEmotionColor[emotion])
                        print(vm.listOfEmotions)
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


