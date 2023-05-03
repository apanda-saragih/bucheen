//
//  RecapView.swift
//  cobaBucheen
//
//  Created by Jonathan Axel Benaya on 26/04/23.
//

import SwiftUI

struct RecapView: View {
    
    @State private var index = 0
    @State var selectedDate: Date = Date()
    var vm: EmotionViewModel
    var vmAffirm: AffirmationViewModel
    
    var body: some View {
        ZStack {
            Color("custom_white").ignoresSafeArea()
            Picker("", selection: $index){
                Text("Myself").tag(0)
                Text("My Partner").tag(1)
            }

            .padding()
            .padding(.bottom, 600)
            .pickerStyle(.segmented)
            
            VStack() {
                Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
                    .font(.system(size: 28))
                    .bold()
                    .foregroundColor(Color.accentColor)
                    .padding()
                    .animation(.spring(), value: selectedDate)
//                Divider().frame(height: 1)
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                    .padding(.horizontal)
                    .datePickerStyle(.graphical)
//                Divider()
            }
            .padding(.vertical, 100)
//            if
            
//            List{
//                ScrollView{
//                    ForEach(vm.listOfEmotions, id: \.self) { emotion in
//                        VStack(alignment : .leading) {
//                            Text(emotion.name ?? "NO EMOTION")
//                            Text(emotion.image ?? "NO IMAGE")
//                            Text(emotion.color ?? "NO COLOR")
//                            Text(emotion.time?.formatted() ?? "NO TIME")
//                        }
//                        .padding()
//                        .onAppear {
//                            print(vm.listOfEmotions.count)
//                        }
//                    }
//                }
//
//            }
            
//            List{
//                ScrollView{
//                    ForEach(vmAffirm.listOfAffirmations, id: \.self) { affirmation in
//                        VStack(alignment : .leading) {
//                            Text(affirmation.name ?? "NO EMOTION")
//                            Text(affirmation.image ?? "NO IMAGE")
////                            Text(emotion.color ?? "NO COLOR")
//                            Text(affirmation.time?.formatted() ?? "NO TIME")
//                        }
//                        .padding()
//                        .onAppear {
//                            print(vmAffirm.listOfAffirmations.count)
//                        }
//                    }
//                }
//
//            }
            
        }
        
    }
}

struct RecapView_Previews: PreviewProvider {
    static var previews: some View {
        RecapView(vm: EmotionViewModel(), vmAffirm: AffirmationViewModel())
    }
}
