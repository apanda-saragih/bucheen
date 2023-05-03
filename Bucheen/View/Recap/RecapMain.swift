//
//  RecapMain.swift
//  Bucheen
//
//  Created by Abraham Putra Lukas on 02/05/23.
//

import SwiftUI

struct RecapMain: View {
    @State var recapUser = "myself"
    @State var selectedDate: Date = Date()
    var vm : EmotionViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Recap of My Feelings")
                LottieView(name: "56301-marriage-couple-hugging", loopMode: .loop)
                Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
                    .font(.system(size: 28))
                    .bold()
                    .foregroundColor(Color.accentColor)
                    .padding()
                    .animation(.spring(), value: selectedDate)
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                    .padding(.horizontal)
                    .datePickerStyle(.graphical)
               
                NavigationLink(destination: RecapEmotionView(selectedDate: $selectedDate)){
                    Text("Go To Recap")
                }
                
//  DEBUG
//                Button {
//                    let listEntity = vm.listOfEmotions.filter({ entity in
//                        if let time = entity.time {
//                            let calendar = Calendar.current
//                            let dateData = calendar.dateComponents([.year,.month,.day], from: time)
//                            let today = calendar.dateComponents([.year,.month,.day], from: selectedDate)
//                            return dateData.year == today.year &&
//                            dateData.month == today.month &&
//                            dateData.day == today.day
//                        }
//                        return false
//                    })
//
//                    print(listEntity.count)
//
//
//                } label: {
//                    Text("Show")
//                }

            }
        }
            
        }
        
    }

//struct RecapMain_Previews: PreviewProvider {
//    static var previews: some View {
//        RecapMain()
//    }
//}
