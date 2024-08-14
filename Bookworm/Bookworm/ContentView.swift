//
//  ContentView.swift
//  Bookworm
//
//  Created by Galih Samudra on 02/08/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Query var students: [Student]
    
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
        }
    }
}

#Preview {
    ContentView()
}
