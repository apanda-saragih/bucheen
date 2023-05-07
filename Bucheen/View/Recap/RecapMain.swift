////
////  RecapMain.swift
////  Bucheen
////
////  Created by Abraham Putra Lukas on 02/05/23.
////
//
//import SwiftUI
//
//struct RecapMain: View {
//    @State var recapUser = "myself"
//    @State var selectedDate: Date = Date()
//    var vmEmotion : EmotionViewModel
//
//    var body: some View {
//        NavigationView{
//            VStack{
//                Text("Feelings Recap")
//                    .bold()
//                    .font(.system(size:26))
//                    .foregroundColor(Color("DarkPurple"))
//                    .padding(.bottom, 12)
//                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
//                    .padding(.horizontal)
//                    .datePickerStyle(.compact)
//
////                RecapEmotionView(selectedDate : $selectedDate, vmEmotion: vmEmotion)
//
//                NavigationLink(destination: RecapEmotionView(selectedDate: $selectedDate, vmEmotion: vmEmotion)){
//                    Text("See Recap")
//                        .font(.headline)
//                        .foregroundColor(Color("custom_white"))
//                        .frame(maxWidth: .infinity)
//                        .frame(height: 54)
//                        .background(Color("dark_purple"))
//                        .cornerRadius(10)
//                }
//                Spacer()
//            }
//        }
//
//    }
//
//}
//
//struct RecapMain_Previews: PreviewProvider {
//    static var previews: some View {
//        RecapMain(vmEmotion: EmotionViewModel())
//    }
//}
