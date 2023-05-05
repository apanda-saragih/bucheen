//
//  InvitePartner.swift
//  Bucheen
//
//  Created by Abraham Putra Lukas on 03/05/23.
//

import SwiftUI

struct InvitePartner: View {
    
    @AppStorage("has_partner") var hasPartner : Bool?
    @AppStorage("code") var code : String?
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image("CryingButton")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .scaledToFit()
                Text("You haven't connect with your partner!")
                    .padding()
                Text("Show This Code To Connect With Your Partner!")
                    .foregroundColor(Color("dark_purple"))
                    .bold()
                    .font(.title)
                    .padding(.horizontal, -10)
                Text(code ?? "No Code")
                    .font(.title2)
                    .padding()
                    .background(Color("light_gray"))
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(.black)
                    }
                    .padding(.bottom)
                
                NavigationLink {
                    InvitationsListPartnerView()
                } label: {
                    Text("See Partner's Invitations")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color("DarkPurple"))
                        .cornerRadius(10)
                }
                
                NavigationLink {
                    AddPartnerView()
                } label: {
                    Text("Enter Partner's Code")
                        .font(.headline)
                        .foregroundColor(Color("dark_purple"))
                        .padding()
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color("super_light_gray"))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color("dark_purple"))
                        )
                }
                
                
            Spacer()
            Spacer()

            }
            .padding()
            .multilineTextAlignment(.center)
        }
        
        
    }
    
}

struct InvitePartner_Previews: PreviewProvider {
    static var previews: some View {
        InvitePartner()
    }
}


