//
//  CircularComponent.swift
//  Bucheen
//
//  Created by Abraham Putra Lukas on 02/05/23.
//

import SwiftUI

struct CircularComponent: View {
    var colorComponent : Color
    var value : Double
    
    var body: some View {
        ZStack { // 1
            Circle()
                .stroke(
                    colorComponent.opacity(0.5),
                    lineWidth: 8
                )
            
            Circle() // 2
                .trim(from: 0, to: value)
                .stroke(
                    colorComponent,
                    style: StrokeStyle(
                          lineWidth: 8,
                          lineCap: .round
                      )
                )
                .rotationEffect(.degrees(-90))
            if (!value.isNaN) {
                Text("\(Int(value*100))%")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(colorComponent)
            }
            
        }
        .padding()
        .frame(width: 100, height: 100)
    }
}

//struct CircularComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        CircularComponent()
//            .environment(\.sizeCategory, .extraSmall)
//    }
//}
