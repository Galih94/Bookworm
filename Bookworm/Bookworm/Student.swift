//
//  Student.swift
//  Bookworm
//
//  Created by Galih Samudra on 13/08/24.
//
import Foundation

@Observable
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
