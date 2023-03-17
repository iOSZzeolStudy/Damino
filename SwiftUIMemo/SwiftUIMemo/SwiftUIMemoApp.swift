//
//  SwiftUIMemoApp.swift
//  SwiftUIMemo
//
//  Created by 김담인 on 2023/03/16.
//

import SwiftUI

@main
struct SwiftUIMemoApp: App {
    @State var store = MemoStore()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store)
        }
    }
}
