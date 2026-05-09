//
//  Swift_UI_Clean_ArchitectureApp.swift
//  Swift_UI_Clean_Architecture
//
//  Created by Akash Revanna on 09/05/26.
//

import SwiftUI
import CoreData

@main
struct Swift_UI_Clean_ArchitectureApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
