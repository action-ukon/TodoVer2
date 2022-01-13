//
//  TodoVer2App.swift
//  TodoVer2
//
//  Created by 坪田和樹 on 2022/01/14.
//

import SwiftUI

@main
struct TodoVer2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
