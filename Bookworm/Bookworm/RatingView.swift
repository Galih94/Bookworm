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
        .accessibilityElement()
        .accessibilityLabel(label)
        .accessibilityValue("\(rating == 1 ? "1 star" : "\(rating) stars")")
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                if rating < maxRating { rating += 1 }
            case .decrement:
                if rating > 1 { rating -= 1 }
            default:
                break
            }
        }

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
