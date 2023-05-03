//
//  RecapChart.swift
//  Bucheen
//
//  Created by Abraham Putra Lukas on 02/05/23.
//

import SwiftUI

struct RecapChart: View {
    
    @State var data1 : [(Double, Color)] = [
                (2, Color.red),
                (3, Color.orange),
                (4, Color.yellow),
                (1, Color.green),
                (5, Color.blue),
                (4, Color.indigo),
                (2, Color.purple)
            ]
    @Binding var data : [(Double, Color)]
    var body: some View {
        Pie(slices: $data)

    }
}

struct Pie: View {

    @Binding var slices: [(Double, Color)]
    var body: some View {
        Canvas { context, size in
            // Add these lines to display as Donut
            //Start Donut
            let donut = Path { p in
                p.addEllipse(in: CGRect(origin: .zero, size: size))
                p.addEllipse(in: CGRect(x: size.width * 0.25, y: size.height * 0.25, width: size.width * 0.5, height: size.height * 0.5))
            }
            context.clip(to: donut, style: .init(eoFill: true))
            //End Donut
            let total = slices.reduce(0) { $0 + $1.0 }
            context.translateBy(x: size.width * 0.5, y: size.height * 0.5)
            var pieContext = context
            pieContext.rotate(by: .degrees(-90))
            let radius = min(size.width, size.height) * 0.48
//            let gapSize = Angle(degrees: 0) // size of the gap between slices in degrees

            var startAngle = Angle.zero
            for (value, color) in slices {
                if (value == 0) {
                    continue
                }
                let angle = Angle(degrees: 360 * (value / total))
                let endAngle = startAngle + angle
                let path = Path { p in
                    p.move(to: .zero)
                    p.addArc(center: .zero, radius: radius, startAngle: startAngle + Angle(degrees: 5) / 2, endAngle: endAngle, clockwise: false)
                    p.closeSubpath()
                }
                pieContext.fill(path, with: .color(color))
                startAngle = endAngle
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

//struct RecapChart_Previews: PreviewProvider {
//    static var previews: some View {
//        RecapChart()
//    }
//}
