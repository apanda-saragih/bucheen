import SwiftUI

struct CircularComponent: View {
    var colorComponent : Color
    var value : Double
    
    var body: some View {
        ZStack { // 1
            Circle()
                .stroke(
                    colorComponent.opacity(0.7),
                    lineWidth: 6
                )
            
            Circle() // 2
                .trim(from: 0, to: value)
                .stroke(
                    colorComponent,
                    style: StrokeStyle(
                          lineWidth: 6,
                          lineCap: .round
                      )
                )
                .rotationEffect(.degrees(-90))
            if (!value.isNaN) {
                Text("\(Int(value*100))%")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(colorComponent)
            }
            
        }
        .padding()
        .frame(width: 90, height: 90)
    }
}

//struct CircularComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        CircularComponent()
//            .environment(\.sizeCategory, .extraSmall)
//    }
//}
