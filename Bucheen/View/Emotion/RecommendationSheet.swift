import SwiftUI

struct RecommendationSheet: View {
    @Binding var currentFeeling : String
   
    @Environment(\.presentationMode) var presentationMode
    @State var listOfRecommendation : [String] = ["No recommendation for you. Please fill your emotion!"]
    
    var body: some View {
        ZStack() {
            Color("custom_white").ignoresSafeArea()
            
            VStack {
                HStack{
                    Spacer()
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title)
                            .padding()
                            .foregroundColor(Color("SadColor"))
                            .frame(width: 50, height: 50)
                            .background(
                                Circle()
                                    .fill(.white)
                            )
                            .overlay(
                               Circle()
                                    .strokeBorder(Color("SadColor"), lineWidth: 3)
                                    .shadow(radius: 10)
                                    
                            )
                    }
                }
                Image(currentFeeling + "Button")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 115, height: 115)
//                Text(currentFeeling)
                Text("Recommendation for You!")
                    .fontWeight(.semibold)
                    .foregroundColor(Color("DarkPurple"))
                    .font(.system(size: 30))
                    .padding(.bottom, 8)
               
//                HStack{
//                    Text("Here’s a ") +
//                    Text("recommendation ").fontWeight(.bold) +
//                    Text("from us based on your ") +
//                    Text("current feelings.").fontWeight(.bold)
//                }
//                .font(.system(size: 18))
//                .padding(8)
                

                ScrollView{
                    Text(listOfRecommendation[Int.random(in: 0..<listOfRecommendation.count)])
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(width: 370)
                        .lineSpacing(10)
                }
                Spacer()
            }
            .padding()
            
        }
        .onAppear{
            let entity = recommendation.filter({
                $0.emotion == currentFeeling
            })
            if entity.isEmpty{
                Text("Empty")
            }else{
                listOfRecommendation = entity[0].recommendation
            }
        }
    }
    
}


//struct RecommendationSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        RecommendationSheet()
//    }
//}
