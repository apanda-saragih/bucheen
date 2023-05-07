//
//  AddPartnerView.swift
//  Bucheen
//
//  Created by Jonathan Axel Benaya on 04/05/23.
//

import SwiftUI

struct AddPartnerView: View {
    @Environment(\.presentationMode) var presentationMode
    
//    var vmEmotion : EmotionViewModel

    @AppStorage("partner_code") var partnerCode : String?
    @AppStorage("has_partner") var hasPartner : Bool?
    
    @State var code1 : String = ""
    @State var currentSection : Int = 0
    @State var no1: String = ""
    @State var no2: String = ""
    @State var no3: String = ""
    @State var no4: String = ""
    @State var no5: String = ""
    
    enum Field : Hashable {
        case no1
        case no2
        case no3
        case no4
        case no5
    }
    
    //focus state
    @FocusState private var focusedField: Field?
    var body: some View {
        VStack(alignment: .leading){
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
            codeSection
        }
        .padding()
        .navigationBarBackButtonHidden(true)
       
    }
    
    var codeTextFieldPartner : some View {
        VStack{
            HStack{
                TextField("", text: $no1)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color("dark_purple"))
                    )
                    .foregroundColor(Color.black)
                    .frame(width: 50)
                    .cornerRadius(5.0)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .focused($focusedField, equals: .no1)
                    .onChange(of: no1) { newValue in
                        if newValue.count == 1 {
                            focusedField = .no2
                        }
                    }
                
                
                TextField("", text: $no2)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color("dark_purple"))
                    )
                    .foregroundColor(Color.black)
                    .frame(width: 50)
                    .cornerRadius(5.0)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .focused($focusedField, equals: .no2)
                    .onChange(of: no2) { newValue in
                        if newValue.count == 1 {
                            focusedField = .no3
                        }
                    }
                
                TextField("", text: $no3)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color("dark_purple"))
                    )
                    .foregroundColor(Color.black)
                    .frame(width: 50)
                    .cornerRadius(5.0)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .focused($focusedField, equals: .no3)
                    .onChange(of: no3) { newValue in
                        if newValue.count == 1 {
                            focusedField = .no4
                        }
                    }
                
                TextField("", text: $no4)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color("dark_purple"))
                    )
                    .foregroundColor(Color.black)
                    .frame(width: 50)
                    .cornerRadius(5.0)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .focused($focusedField, equals: .no4)
                    .onChange(of: no4) { newValue in
                        if newValue.count == 1 {
                            focusedField = .no5
                        }
                    }
                
                TextField("", text: $no5)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color("dark_purple"))
                    )
                    .foregroundColor(Color.black)
                    .frame(width: 50)
                    .cornerRadius(5.0)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .focused($focusedField, equals: .no5)
                    .onChange(of: no5) { newValue in
                        if newValue.count == 1 {
                            code1 = no1 + no2 + no3 + no4 + no5
                        }
                    }
                

            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    focusedField = .no1
            }
        }
//            NavigationLink(destination: EmotionView()) {
//                Text("Connect")
//                    .foregroundColor(.white)
//                    .padding()
//                    .padding(.horizontal)
//                    .frame(maxWidth: .infinity, minHeight: 50)
//                    .background(Color("DarkPurple"))
//                    .cornerRadius(10)
//            }
            
            Button {
                //function to fetch data according to partner's code
                partnerCode = code1
                hasPartner = true
            } label: {
                Text("Connect")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(isCodeEligible(code: code1) ? Color("DarkPurple") : Color("light_gray"))
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            .disabled(!isCodeEligible(code: code1))
            
        }.navigationBarBackButtonHidden(true)
            .toolbar(content: {
                ToolbarItem (placement: .navigationBarLeading)  {
                         
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                      //  Image(systemName: "arrow.left")
                        Image("Back Button")
                        .foregroundColor(.yellow)
                    })
                    
                }
            })
    }
    
    private var codeSection : some View {
        VStack {
            Spacer()
            
            VStack (spacing: 20) {
                Text ("Input their unique code")
//                    .padding(.bottom, 12)
                    .fontWeight(.light)
                Text("To Connect Emotions With Your Partner!")
                    .foregroundColor(Color("dark_purple"))
                    .bold()
                    .font(.title)
                    .padding(.horizontal, -10)
            }
            .multilineTextAlignment(.center)
            .navigationBarBackButtonHidden()
            
            codeTextFieldPartner
            
            Spacer()
            Spacer()
            Spacer()
            
        }
        .padding(30)
    }
    
}

struct AddPartnerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPartnerView()
    }
}

//MARK: FUNCTIONS

extension AddPartnerView {
    func isCodeEligible(code : String) -> Bool {
        if code1.count == 5 {
            return true
        }
        return false
    }
    
}

