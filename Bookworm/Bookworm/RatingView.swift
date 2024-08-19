//
//  RatingView.swift
//  Bookworm
//
//  Created by Galih Samudra on 16/08/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maxRating = 6
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maxRating, id: \.self) { numb in
                Button(role: nil) {
                    rating = numb
                } label: {
                    image(for: numb)
                        .foregroundStyle(numb > rating ? offColor : onColor)
                }

            }
        }
        .buttonStyle(.plain)
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(3))
}
