//
//  RegisterView.swift
//  cobaBucheen
//
//  Created by Jonathan Axel Benaya on 22/04/23.
//

import SwiftUI

struct RegisterView: View {
    
    //state var
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
    
    //app storage
    @AppStorage("name") var name : String = ""
    @AppStorage("code") var code : String = ""
    @AppStorage("signed_in") var hasAccount : Bool = false
    @AppStorage("never_sign_in") var neverSignedIn : Bool = true
    
    var body: some View {
        ZStack () {
                switch currentSection {
                case 0 :
                    welcomeSection
                case 1 :
                    nameSection
                case 2 :
                    codeSection
                default :
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.red)
                }
            VStack {
                Spacer()
                navigationButton
            }
            .padding(30)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}


// MARK: COMPONENTS
extension RegisterView {
    
    private var navigationButton : some View {
        
        Button {
            hasPressedButton()
        } label: {
            Text(currentSection == 0 ? "Register" :
                    currentSection == 1 ? "Next" : "Let's Go!")
                .font(.headline)
                .foregroundColor(Color("custom_white"))
                .frame(maxWidth: .infinity)
                .frame(height: 54)
                .background(isTextEligible() ? Color("dark_purple") : Color("light_gray"))
                .cornerRadius(10)
        }
        .disabled(!isTextEligible())
        .padding(.vertical, 40)

        
    }
    
    private var welcomeSection : some View {
        ZStack {
            Image("WelcomeScreenBackground")
                .resizable()
                .ignoresSafeArea()
            VStack (alignment : .leading, spacing: 10) {
                Spacer()
                Spacer()
                Spacer()
                HStack {
                    Text("Hi!")
                        .font(.title3)
                        .fontWeight(.light)
                    Spacer()
                }
                Text("Bucheeners")
                    .foregroundColor(Color("dark_purple"))
                    .font(.title)
                    .bold()
                Text ("Track, Share, and Connect with Your Partner’s Emotions in **Bucheen.** ")
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            .padding(30)
        }
      
    }
    
    private var nameSection : some View {
        VStack {
            Spacer()
            VStack (spacing: 20) {
                Text("Register")
                    .foregroundColor(Color("dark_purple"))
                    .bold()
                    .font(.title)
                Text ("Hi! Please enter your name and unique code to connect with your partner! ")
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                    .fontWeight(.light)
            }
            .multilineTextAlignment(.center)
            
            
            VStack(alignment: .leading) {
                Text("Name")
                    .font(.headline)
                TextField("Please enter your name", text: $name)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(Color.black)
                    )
                  
            }
            Spacer()
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    
    private var codeSection : some View {
        VStack {
            Spacer()
            
            VStack (spacing: 20) {
                Text("Unique Code")
                    .foregroundColor(Color("dark_purple"))
                    .bold()
                    .font(.title)
                Text ("Create your own unique code to connect your emotions with your partner privately! ")
                    .padding(.bottom, 20)
                    .fontWeight(.light)
            }
            .multilineTextAlignment(.center)
            
            codeTextField
            
            Spacer()
            Spacer()
            Spacer()
            
        }
        .padding(30)
    }
    
    private var codeTextField : some View {
        HStack {
           
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
                   code = no1 + no2 + no3 + no4 + no5
               }
           }

        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                focusedField = .no1
            }
        }
    }
}


//MARK: FUNCTIONS
extension RegisterView {
    func hasPressedButton(){
        if currentSection == 2 {
            hasAccount = true
        } else {
            currentSection += 1
        }
    }
    
    func isTextEligible() -> Bool{
        if currentSection == 0 {
            return true
        }else if currentSection == 1{
            if name.count >= 3{
                return true
            } else{
                return false
            }
        }else if code.count == 5 {
            return true
        }else {
            return false
        }
    }
}
