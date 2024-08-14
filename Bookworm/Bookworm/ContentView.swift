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
    @Query var students: [Student]
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar(content: {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                    let choosenFirstName = firstNames.randomElement() ?? "Def"
                    let choosenLastName = lastNames.randomElement() ?? "Def"
                    
                    let student = Student(id: UUID(), name: "\(choosenFirstName) \(choosenLastName)")
                    modelContext.insert(student)
                }
            })
        }
    }
}

#Preview {
    ContentView()
}
