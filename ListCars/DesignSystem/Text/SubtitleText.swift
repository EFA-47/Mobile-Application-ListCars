//
//  SubtitleText.swift
//  ListCars
//
//  Created by Emir Fatih AYYILDIZ on 8.01.2024.
//

import SwiftUI

struct SubtitleText: View {

    private let text: String

    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .font(.title3)
            .padding(Spacing.spacing_2)
    }
}

#Preview {
    SubtitleText(text: "Text")
}
