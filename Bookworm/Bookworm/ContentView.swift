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
    @Query(sort: [
        SortDescriptor(\Book.author, order: .reverse),
        SortDescriptor(\Book.title),
    ]) var books: [Book]
    @State private var showingAddScreem = false
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            
            modelContext.delete(book)
        }
    }
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                    .foregroundStyle(book.rating == 1 ? .red : .primary)
                                Text(book.author)
                                    .foregroundStyle(book.rating == 1 ? .red : .secondary)
                                Text(book.getDateString())
                                    .foregroundStyle(book.rating == 1 ? .red : .secondary)
                            }
                        }
                    }
                    .navigationDestination(for: Book.self) { book in
                        DetailView(book: book)
                    }
                }
                .onDelete { indexSet in
                    deleteBooks(at: indexSet)
                }
            }
            .navigationTitle("Bookworm")
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showingAddScreem.toggle()
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
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
