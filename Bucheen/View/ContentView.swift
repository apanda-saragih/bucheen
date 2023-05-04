//
//  ContentView.swift
//  cobaBucheen
//
//  Created by Jonathan Axel Benaya on 22/04/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @AppStorage("signed_in") var hasAccount : Bool = false
    @AppStorage("name") var name : String?
    @AppStorage("code") var code : String?
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \EmotionEntity.time, ascending: true)],
        animation: .default)
    var emotionsList: FetchedResults<EmotionEntity>
    
    @StateObject var vmAffirm = AffirmationViewModel()
    
    @State var selectedTab : Int = 0

    var body: some View {
        ZStack {
            if hasAccount {
                TabView (selection: $selectedTab){
                    EmotionView()
                        .tabItem {
                            Image("emotions")
                            Text("Emotions")
                        }
                        .tag(0)
                    RecapMain(emotionsList: emotionsList)
                        .tabItem {
                            Image("recap")
                            Text("Recap")
                        }
                        .tag(1)
                    ProfileView()
                        .tabItem {
                            Image("profile")
                            Text("Profile")
                        }
                        .tag(2)
                }
                .accentColor(Color("dark_purple"))
            } else {
                RegisterView()
            }
        }
    }

   
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
