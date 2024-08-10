//
//  Danendra_Darmawansyah_SUITMEDIA_TestApp.swift
//  Danendra-Darmawansyah_SUITMEDIA-Test
//
//  Created by Kleo Handayani on 10/08/24.
//

import SwiftUI

@main
struct Danendra_Darmawansyah_SUITMEDIA_TestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
