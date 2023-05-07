//
//  AffirmationView.swift
//  Bucheen
//
//  Created by Abraham Putra Lukas on 28/04/23.
//

import SwiftUI

struct AffirmationView: View {
    
    var vmAffirm: AffirmationViewModel
    var vmEmotion : EmotionViewModel
    
    @State private var isAnimating = false
    @State var partnerEmotionsColor : [Color] = []
    @State var currentFeeling : String = ""
    
    @AppStorage("code") var code : String?
    @AppStorage("partner_code") var partnerCode : String?
    @AppStorage("name") var name : String?
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        VStack {
            Text("Hi, " + (name ?? "User"))
                .bold()
                .font(.system(size:26))
                .foregroundColor(Color("DarkPurple"))
            
            Text("Here is your partner current feeling today")
                    .padding(.top)
            Text(currentFeeling)
                .font(.headline)
                .frame(minWidth: 100)
                .padding()
                .background(Color("super_light_gray"))
                .cornerRadius(5)

            EmotionBallView(emotionColor: $partnerEmotionsColor)
            AffirmationListView
        }
        .onAppear(){
            vmEmotion.fetchEmotions(userCode: partnerCode ?? "00000", partnerCode: partnerCode ?? "partner")
            vmAffirm.fetchAffirmation(partnerCode: code ?? "partner")
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
                    return user == partnerCode
                }
                return false
            })

            if listEntity.isEmpty {
                currentFeeling = "No Feeling"
            } else {
                currentFeeling = listEntity[listEntity.count-1].name ?? "No Feeling"
            }
            
        //Get ColorEntity
            partnerEmotionsColor  = listEntity.map({ entity in
                if let color = entity.color{
                    return Color(color)
                }
                return Color("HappyEmotion")
            })
        }
    }
}

struct AffirmationView_Previews: PreviewProvider {
    static var previews: some View {
        AffirmationView(vmAffirm: AffirmationViewModel(), vmEmotion: EmotionViewModel())
    }
}



extension AffirmationView {
    
    private var AffirmationListView: some View {
        LazyVGrid(columns: adaptiveColumns) {
            ForEach(0..<constantListOfAffirmation.count, id:\.self) { affirmation in
                VStack{
                    Button {
                        
                        vmAffirm.addAffirmation(name: constantListOfAffirmation[affirmation], image: constantListOfAffirmation[affirmation], userCode: code ?? "00000"
                        )
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
