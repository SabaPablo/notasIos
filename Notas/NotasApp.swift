//
//  NotasApp.swift
//  Notas
//
//  Created by Pablo Nicolas Sabaliauskas on 2023-03-26.
//

import SwiftUI

@main
struct NotasApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
