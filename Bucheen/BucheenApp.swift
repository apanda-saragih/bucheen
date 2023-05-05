//
//  BucheenApp.swift
//  Bucheen
//
//  Created by Abraham Putra Lukas on 14/04/23.
//

import SwiftUI

@main
struct BucheenApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
