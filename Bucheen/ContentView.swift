//
//  ContentView.swift
//  Bucheen
//
//  Created by Abraham Putra Lukas on 14/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "circle.fill")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("xmark")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
