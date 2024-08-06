//
//  ContentView.swift
//  Bookworm
//
//  Created by Galih Samudra on 02/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var rememberMe = false
    var body: some View {
        Toggle("is remember me", isOn: $rememberMe)
    }
}

#Preview {
    ContentView()
}
