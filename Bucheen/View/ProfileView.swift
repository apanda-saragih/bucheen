import SwiftUI

struct ProfileView: View {
    @State private var segmentedController = "Myself"
    @State var hideSegmented : Bool = false
    
    @AppStorage("signed_in") var hasAccount : Bool?
    @AppStorage("name") var name : String?
    @AppStorage("code") var code : String?
    @AppStorage("has_partner") var hasPartner : Bool?
    @AppStorage("partner_code") var partnerCode : String?
    
    var body: some View {
            
        VStack (spacing : 10) {
            Text("My Profile")
                .bold()
                .font(.system(size:26))
                .foregroundColor(Color("DarkPurple"))
                .padding(.bottom, 12)
            
            VStack {
                HStack {
                    Text("Name")
                    Spacer()
                }
                Text(name ?? "No name")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(.black)
                    )
                HStack {
                    Text("Code")
                    Spacer()
                }
                Text(code ?? "No code")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(.black)
                    )
            }
            
            Button {
                signOut()
            } label: {
                Text("Sign Out")
                    .font(.headline)
                    .foregroundColor(Color("custom_white"))
                    .frame(maxWidth: .infinity)
                    .frame(height: 54)
                    .background(Color("dark_purple"))
                    .cornerRadius(10)
            }
            .padding(.top, 20)

            Button {
                endRelationship()
            } label: {
                Text("End Relationship")
                    .font(.headline)
                    .foregroundColor(Color("custom_white"))
                    .frame(maxWidth: .infinity)
                    .frame(height: 54)
                    .background(Color("AngryColor"))
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
       
    }
    
    
}

//    struct ProfileView_Previews: PreviewProvider {
//        static var previews: some View {
//            ProfileView(hasPartner: Binding.constant(false))
//        }
//    }


//MARK: FUNCTIONS

extension ProfileView {
    func signOut() {
        name = ""
        code = ""
        partnerCode = ""
        hasAccount = false
        hasPartner = false
    }
    
    func endRelationship(){
        partnerCode = ""
        hasPartner = false
    }
}
