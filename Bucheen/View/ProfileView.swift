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
        NavigationView {
            ZStack {
                Color("custom_white").ignoresSafeArea()
                VStack {
                    Text("My Profile")
                        .bold()
                        .font(.system(size:26))
                        .foregroundColor(Color("DarkPurple"))
                        .padding(.bottom, 12)//
//                    Image(systemName: "person.circle.fill")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width : 150, height : 150)
                    Text(name ?? "No Name")
                        .font(.system(size: 22))
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 330, height: 50)
                        .background(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1).fill(Color(.black)).shadow(radius: 1))
                        .padding(.bottom, 12)
                    Text(code ?? "No Code")
                        .font(.system(size: 22))
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 330, height: 50)
                        .background(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1).fill(Color(.black)).shadow(radius: 1))
//                    Spacer()
                    Button {
                        name = ""
                        code = ""
                        hasAccount = false
                    } label: {
                        Text("SIGN OUT")
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color("DarkPurple"))
                            .cornerRadius(10)
                        
                    }
                    
                    
                }
                .padding()
            }
        }

        }
    
    
}

    
    struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
        }
    }
