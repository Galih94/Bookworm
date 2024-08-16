//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Galih Samudra on 02/08/24.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
