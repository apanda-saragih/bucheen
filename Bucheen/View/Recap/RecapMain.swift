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
    var emotionsList: FetchedResults<EmotionEntity>
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Recap of My Feelings")
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

            }
        }
            
    }
        
}

//struct RecapMain_Previews: PreviewProvider {
//    static var previews: some View {
//        RecapMain()
//    }
//}
