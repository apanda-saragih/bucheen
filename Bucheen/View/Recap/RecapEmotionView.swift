//
//  RecapEmotionView.swift
//  Bucheen
//
//  Created by Abraham Putra Lukas on 02/05/23.
//

import SwiftUI

struct RecapEmotionView: View {
    
    @AppStorage("code") var code : String?
    @AppStorage("partner_code") var partnerCode : String?
    
    @Binding var selectedTab : Int
    
    @State var recapUser = "null"
    @State var selectedDate : Date = Date.now
    @State var listColorEmotion = constantListOfEmotionColor
    @State var listOfEmotion = constantListOfEmotion
    
    @State var listNameEntity : [String] = []
    @State var totalDataEachEmotion : [Int] = []
    @State var listImageEntity : [String] = []
    @State var listColorEntity : [Color] = []
    @State var listTimeEntity : [String] = []
    
    
    @State var dataChart : [(Double, Color)] = []
    
    var vmEmotion : EmotionViewModel
    
    var body: some View {
        VStack{
            Picker("", selection: $recapUser){
                Text("Myself").tag("mySelf")
                Text("My Partner").tag("myPartner")
            }
            .padding()
            .pickerStyle(.segmented)
            .onChange(of: recapUser) { _ in
                onPickerChanged()
            }
            Text(recapUser == "mySelf" ? "Recap of My Feelings" : "Recap of My Partner Feelings")
                .bold()
                .font(.system(size:26))
                .foregroundColor(Color("DarkPurple"))
                .padding(.bottom, 12)
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                .padding(.horizontal)
                .datePickerStyle(.compact)
                .onChange(of: selectedDate) { newValue in
                    onPickerChanged()
                }
            
            ScrollView {
                if(recapUser == "mySelf"){
                    Pie(slices: $dataChart)
                        .frame(width: 215,height: 215)
                        .onAppear{
                            print($dataChart)
                        }
                    
                    ScrollView(.horizontal) {
                        LazyHStack(alignment : .center) {
                            ForEach(0..<totalDataEachEmotion.count, id: \.self) { index in
                                if Double(totalDataEachEmotion[index])/Double(totalDataEachEmotion.reduce(0, { $0 + $1 })) > 0 {
                                    VStack{
                                        CircularComponent(colorComponent: constantListOfEmotionColor[index], value: Double(totalDataEachEmotion[index])/Double(totalDataEachEmotion.reduce(0, { $0 + $1 })))
                                        Text(constantListOfEmotion[index])
                                    }
                                }
                                
                            }
                        }
                    }
                    
                    ScrollView(.vertical) {
                        VStack(alignment:.leading) {
                            ForEach((0..<listNameEntity.count).reversed(), id: \.self) { index in
                                LogEmotion(emotionImage: listImageEntity[index], emotionName: listNameEntity[index], date: listTimeEntity[index])
                                Divider()
                            }
                        }
                        .padding()
                    }
                }else{
                    Pie(slices: $dataChart)
                        .frame(width: 215,height: 215)
                        .onAppear{
                            print($dataChart)
                        }

                    HStack(){
                        ScrollView(.horizontal) {
                            LazyHStack() {
                                ForEach(0..<totalDataEachEmotion.count, id: \.self) { index in
                                    if Double(totalDataEachEmotion[index])/Double(totalDataEachEmotion.reduce(0, { $0 + $1 })) > 0 {
                                        VStack{
                                            CircularComponent(colorComponent: constantListOfEmotionColor[index], value: Double(totalDataEachEmotion[index])/Double(totalDataEachEmotion.reduce(0, { $0 + $1 })))
                                            Text(constantListOfEmotion[index])
                                        }
                                        
                                    }
                                }
                            }
                        }
                    }
                    
                    VStack(alignment:.leading) {
                        ForEach((0..<listNameEntity.count).reversed(), id: \.self) { index in
                            LogEmotion(emotionImage: listImageEntity[index], emotionName: listNameEntity[index], date: listTimeEntity[index])
                            Divider()
                        }
                    }
                    .padding()
                }
            }
        }
        .onChange(of: selectedTab, perform: { _ in
            onPickerChanged()
        })
        .onAppear() {
            recapUser = "null"
            if recapUser == "null" {
                recapUser = "mySelf"
            }
        }
        
        
        
    }
    
    
    func setData(setOfColor: [Color], setOfDataColor : [Color]) -> [(Double, Color)]{
        var data : [(Double, Color)] = []
        for color in setOfColor {
            let sum = setOfDataColor.filter({ colorData in
                return color == colorData
            }).count
            data.append((Double(sum),color))
        }
        return data
    }
    
    func countItemOfList(listOfString : [String], listOfData : [String]) -> [Int]{
        var listOfNumber : [Int] = []
        for text in listOfString {
            listOfNumber.append((listOfData.filter({$0 == text})).count)
        }
        return listOfNumber
    }
    
    
    
    
}

//struct RecapEmotionView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecapEmotionView(selectedDate: <#Binding<Date>#>)
//    }
//}


//MARK: FUNCTIONS

extension RecapEmotionView {
    
    func onPickerChanged () {
        vmEmotion.fetchEmotions(userCode: code ?? "00000", partnerCode: partnerCode ?? "partner")
        var currentCode : String
        
        if (recapUser == "mySelf") {
            currentCode = code ?? "00000"
        } else {
            currentCode = partnerCode ?? "partner"
        }
        //Get Entity
        var listEntity = vmEmotion.listOfEmotions.filter({ entity in
            if let time = entity.time {
                let calendar = Calendar.current
                let dateData = calendar.dateComponents([.year,.month,.day], from: time)
                let today = calendar.dateComponents([.year,.month,.day], from: selectedDate)
                return dateData.year == today.year &&
                dateData.month == today.month &&
                dateData.day == today.day
            }
            return false
        })
        
        listEntity = listEntity.filter({ entity in
            if let user = entity.userCode {
                return user == currentCode
            }
            return false
        })
        
        //Get ColorEntity
        let listColor = listEntity.map({ entity in
            if let color = entity.color{
                return Color(color)
            }
            return Color("HappyEmotion")
        })
        listColorEntity = listColor
        
        //Get data for the Chart
        dataChart = setData(setOfColor: listColorEmotion, setOfDataColor: listColorEntity)
        
        //Get EmotionNameEntity
        listNameEntity = listEntity.map({entity in
            if let name = entity.name{
                return name
            }
            return("Happy")
        })
        
        //GetIconNameEntity
        
        listImageEntity = listEntity.map({ entity in
            if let image = entity.image{
                return image + "Button"
            }
            return ("HappyButton")
        })
        
        //Get totalDataEachEmotion
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = timeFormatForRecap
        
        totalDataEachEmotion = countItemOfList(listOfString: listOfEmotion, listOfData: listNameEntity)
        
        //GetTime
        listTimeEntity = listEntity.map({ entity in
            if let time = entity.time{
                return dateFormatter.string(from: time)
            }
            return ""
        })
    }
    
}

