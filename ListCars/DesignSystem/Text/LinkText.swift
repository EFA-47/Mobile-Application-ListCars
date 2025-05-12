//
//  LinkText.swift
//  ListCars
//
//  Created by Emir Fatih AYYILDIZ on 8.01.2024.
//

import SwiftUI

struct LinkText: View {

    let text: String

    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .foregroundStyle(.linkText)
    }
}

#Preview {
    LinkText(text: "Test")
}
