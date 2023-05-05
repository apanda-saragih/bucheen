//
//  InvitationsListPartnerView.swift
//  Bucheen
//
//  Created by Jonathan Axel Benaya on 04/05/23.
//

import SwiftUI

struct InvitationsListPartnerView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var nameList : [String] = ["Axel", "Panda", "Octa", "Aam"]
    
    var body: some View {
        VStack{
           HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                        .background(
                            Circle()
                                .foregroundColor(Color("light_gray"))
                        )
                }
               Spacer()
            }
            
            VStack(alignment: .center){
                Text("Partner Invitations")
                    .foregroundColor(Color("dark_purple"))
                    .bold()
                    .font(.title)
                    .padding()
                Text ("Hi! Please make sure to accept your right partner")
                    .fontWeight(.light)
            }
            .multilineTextAlignment(.center)
            
            List {
                ForEach(nameList, id: \.self) { name in
                    HStack {
                        Text(name)
                        Spacer()
                        HStack{
                            Image(systemName: "xmark")
                            Image(systemName: "checkmark")
//                                    .onTapGesture {
//                                        print("HI!!!")
//                                    }
                        }
                    }
                    
                }
                
                
            }
            .listStyle(.plain)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        
    }
}

struct InvitationsListPartnerView_Previews: PreviewProvider {
    static var previews: some View {
        InvitationsListPartnerView()
    }
}
