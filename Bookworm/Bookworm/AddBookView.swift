//
//  AddBookView.swift
//  Bookworm
//
//  Created by Galih Samudra on 16/08/24.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var showAlert = false
    @State private var alertMsg = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mistery", "Poetry", "Romance", "Thriller"]
    private func saveBook() {
        if title.isEmpty {
            showAlert = true
            alertMsg = "Book's title is empty, please fill the book's title"
            return
        } else if author.isEmpty {
            showAlert = true
            alertMsg = "Book's author is empty, please fill the book's author"
            return
        } else if review.isEmpty {
            showAlert = true
            alertMsg = "Book's review is empty, please fill the book's review"
            return
        }
        
        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
        modelContext.insert(newBook)
        dismiss()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write Review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                
                Section {
                    Button("Save") {
                        saveBook()
                    }
                }
            }
            .navigationTitle("Add Book")
            .alert("Failed to save", isPresented: $showAlert) {
                Button("OK") {}
            } message: {
                Text(alertMsg)
            }

        }
    }
}

#Preview {
    AddBookView()
}
