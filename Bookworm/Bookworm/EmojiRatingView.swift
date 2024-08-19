//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Galih Samudra on 19/08/24.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int
    var body: some View {
        switch rating {
        case 1:
            Image(systemName: "1.circle")
                .foregroundStyle(.red)
        case 2:
            Image(systemName: "2.circle")
                .foregroundStyle(.brown)
        case 3:
            Image(systemName: "3.circle")
                .foregroundStyle(.gray)
        case 4:
            Image(systemName: "4.circle")
                .foregroundStyle(.green)
        default:
            Image(systemName: "5.circle")
                .foregroundStyle(.yellow)
        }
    }
}

#Preview {
    EmojiRatingView(rating: 1)
}
