//
//  ProfileView.swift
//  cobaBucheen
//
//  Created by Jonathan Axel Benaya on 24/04/23.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("signed_in") var hasAccount : Bool?
    @AppStorage("name") var name : String?
    @AppStorage("code") var code : String?
    
    var body: some View {
        
        ZStack {
            Color("custom_white").ignoresSafeArea()
            
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width : 150, height : 150)
                Text(name ?? "No name")
                Text(code ?? "No code")
                
//                Button {
//                    name = ""
//                    code = ""
//                    hasAccount = false
//                } label: {
//                    Text("SIGN OUT")
//                        .foregroundColor(.white)
//                        .padding()
//                        .padding(.horizontal)
//                        .frame(maxWidth: .infinity, minHeight: 50)
//                        .background(.blue)
//                        .cornerRadius(10)
//
//                }
            }
            .padding()
        }
        

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
