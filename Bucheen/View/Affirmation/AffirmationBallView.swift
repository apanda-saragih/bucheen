//
//  AffirmationBallView.swift
//  Bucheen
//
//  Created by Abraham Putra Lukas on 29/04/23.
//

import SwiftUI

struct AffirmationBallView: View {
    var body: some View {
        Circle()
            .strokeBorder(.gray, lineWidth: 2)
            .foregroundColor(Color("SuperLightGray"))
            .frame(width: 223, height: 223)
        
    }
}

struct AffirmationBallView_Previews: PreviewProvider {
    static var previews: some View {
        AffirmationBallView()
    }
}
