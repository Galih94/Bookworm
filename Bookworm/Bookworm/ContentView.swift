//
//  ContentView.swift
//  Bookworm
//
//  Created by Galih Samudra on 02/08/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    @State private var showingAddScreem = false
    
    var body: some View {
        NavigationStack{
            Text("Count: \(books.count)")
                .navigationTitle("Bookworm")
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Book", systemImage: "plus") {
                            showingAddScreem.toggle()
                        }
                    }
                })
                .sheet(isPresented: $showingAddScreem, content: {
                    AddBookView()
                })
        }
    }
}

#Preview {
    ContentView()
}
