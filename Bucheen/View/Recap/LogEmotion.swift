//
//  LogEmotion.swift
//  Bucheen
//
//  Created by Abraham Putra Lukas on 02/05/23.
//

import SwiftUI

struct LogEmotion: View {
    var emotionImage : String
    var emotionName : String
    var date : String
    var body: some View {
        HStack{
            Image(emotionImage)
            VStack(alignment: .leading){
                Text(date)
                    .font(.title)
                Text("You are Feeling \(emotionName)")
            }
        }
    }
}

struct LogEmotion_Previews: PreviewProvider {
    static var previews: some View {
        LogEmotion(emotionImage: "HappyButton", emotionName: "Happy", date: "20:39 PM")
    }
}

