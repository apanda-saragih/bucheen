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
    @State var currentFeeling : String = ""
    @State var currentAffirmation : String = ""
    @State var showRecommendationSheet : Bool = false
    @State var showAffirmation : Bool = false
    
    @AppStorage("name") var name : String?
    @AppStorage("code") var code : String?
    @AppStorage("partner_code") var partnerCode : String?
    @AppStorage("has_partner") var hasPartner : Bool?
    
    @StateObject var vmAffirm = AffirmationViewModel()
    
    var vmEmotion : EmotionViewModel
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        ZStack {
            Color("custom_white").ignoresSafeArea()
//            ScrollView {
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
                                .onChange(of: segmentedController) { newValue in
                                    onEmotionAffirmationChanged()
                                }
                    
                    if(segmentedController == "Myself"){
                        Text("Hi, " + (name ?? "User") + "!")
                            .bold()
                            .font(.system(size:26))
                            .foregroundColor(Color("DarkPurple"))
                            .padding(.bottom, 12)// DarkPurple is defined in asset
                    Text("How is your current feeling today?")
                            .padding(.bottom)
                        
                    Button {
                        showAffirmation.toggle()
                    } label: {
                        Text(currentFeeling)
                                .font(.headline)
                                .frame(minWidth: 100)
                                .foregroundColor(Color.black)
                                .padding()
                                .background(Color("super_light_gray"))
                                .cornerRadius(5)
                        
                    }
                    .fullScreenCover(isPresented: $showAffirmation) {
                        AffirmationSheet(currentAffirmation: $currentAffirmation, vmAffirm: vmAffirm)
                    }
                    
                            
                            
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
//                        .padding()
                        .fullScreenCover(isPresented: $showRecommendationSheet) {
                            RecommendationSheet(currentFeeling: $currentFeeling)
                        }
                        
                        

                        
                        EmotionListView
                            .padding(0)
                    } else if (segmentedController == "My Partner"){
                        if hasPartner ?? false {
                            AffirmationView(vmAffirm: vmAffirm, vmEmotion: vmEmotion)
                        } else {
                            InvitePartner()
                        }
                        
                    }
                }
                .multilineTextAlignment(.center)
//            }
        }
        .onAppear{
            vmEmotion.fetchEmotions(userCode: code ?? "00000", partnerCode: partnerCode ?? "partner")
            vmAffirm.fetchAffirmation(partnerCode: partnerCode ?? "partner")
            
        }
        .onReceive(vmEmotion.$listOfEmotions) { _ in
            var listEntity = vmEmotion.listOfEmotions.filter({ entity in
                
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
            
            listEntity = listEntity.filter({ entity in
                if let user = entity.userCode {
                    return user == code
                }
                return false
            })

            if listEntity.isEmpty {
                currentFeeling = "No Feeling"
            } else {
                currentFeeling = listEntity[listEntity.count-1].name ?? "No Feeling"
            }
            
            userEmotionsColor  = listEntity.map({ entity in
                if let color = entity.color{
                    return Color(color)
                }
                return Color("HappyEmotion")
            })
            
            
        }
        .onReceive(vmAffirm.$listOfAffirmation) { _ in
            var lastAffirmation = vmAffirm.listOfAffirmation.filter { entity in
                if let time = entity.time {
                    let calendar = Calendar.current
                    let dateData = calendar.dateComponents([.year,.month,.day], from: time)
                    let today = calendar.dateComponents([.year,.month,.day], from: Date.now)
                    return dateData.year == today.year &&
                    dateData.month == today.month &&
                    dateData.day == today.day
                }
                return false
            }
            
            lastAffirmation = lastAffirmation.filter({ entity in
                if let user = entity.userCode {
                    return user == partnerCode
                }
                return false
            })
            
            
            print("=========1==========")
            print(lastAffirmation)
            
            lastAffirmation = lastAffirmation.sorted { $0.time! < $1.time ?? Date.now }
            
            if lastAffirmation.isEmpty {
                currentAffirmation = "No Affirmation"
            } else {
                currentAffirmation = lastAffirmation.last?.name ?? "No Affirmation"
            }
            
            print("CURRENT AFFIRMATION")
            print(currentAffirmation)
        }
    }
}

struct EmotionView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionView(vmEmotion: EmotionViewModel())
    }
}


//MARK: COMPONENTS
extension EmotionView {
    
    private var EmotionListView: some View {
        LazyVGrid(columns: adaptiveColumns) {
            ForEach(0..<constantListOfEmotion.count, id:\.self) { emotion in
                VStack{
                    Button {
                        vmEmotion.addEmotions(
                            userCode : code ?? "00000",
                            name: constantListOfEmotion[emotion],
                            image: constantListOfEmotion[emotion],
                            color: constantListOfEmotion[emotion] + "Color")
                        userEmotionsColor.append(constantListOfEmotionColor[emotion])
                        currentFeeling = constantListOfEmotion[emotion]
                        print(vmEmotion.listOfEmotions)
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

//MARK: FUNCTIONS
extension EmotionView {
    
    func onEmotionAffirmationChanged() {
        vmEmotion.fetchEmotions(userCode: code ?? "00000", partnerCode: partnerCode ?? "partner")
        vmAffirm.fetchAffirmation(partnerCode: partnerCode ?? "partner")
        
        var listEntity = vmEmotion.listOfEmotions.filter({ entity in
            
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
        
        listEntity = listEntity.filter({ entity in
            if let user = entity.userCode {
                return user == code
            }
            return false
        })

        if listEntity.isEmpty {
            currentFeeling = "No Feeling"
        } else {
            currentFeeling = listEntity[listEntity.count-1].name ?? "No Feeling"
        }
        
        userEmotionsColor  = listEntity.map({ entity in
            if let color = entity.color{
                return Color(color)
            }
            return Color("HappyEmotion")
        })
        
        var lastAffirmation = vmAffirm.listOfAffirmation.filter { entity in
            if let time = entity.time {
                let calendar = Calendar.current
                let dateData = calendar.dateComponents([.year,.month,.day], from: time)
                let today = calendar.dateComponents([.year,.month,.day], from: Date.now)
                return dateData.year == today.year &&
                dateData.month == today.month &&
                dateData.day == today.day
            }
            return false
        }
        
        lastAffirmation = lastAffirmation.filter({ entity in
            if let user = entity.userCode {
                return user == partnerCode
            }
            return false
        })
        
        
        print("=========1==========")
        print(lastAffirmation)
        
        if lastAffirmation.isEmpty {
            currentAffirmation = "No Affirmation"
        } else {
            currentAffirmation = lastAffirmation.last?.name ?? "No Affirmation"
        }
    }
    
}


