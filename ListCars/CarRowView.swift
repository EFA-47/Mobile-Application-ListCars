//
//  CarRowView.swift
//  ListCars
//
//  Created by Emir Fatih AYYILDIZ on 8.01.2024.
//

import SwiftUI

struct CarRowView: View {
    private let car: Car
    private let onAddButtonTapped: () -> Void
    @StateObject var dataManager = DataManager()

    init(car: Car, onAddButtonTapped: @escaping () -> Void) {
        self.car = car
        self.onAddButtonTapped = onAddButtonTapped
    }

    var body: some View {
        HStack(spacing: .zero) {
            Text(car.model)
            Spacer()
//            ButtonDS(buttonTitle: "ADD", action: onAddButtonTapped)
            Button{
                dataManager.addCars(car: car)
            } label: {
                Text("View")
            }
        }
    }
}

//#Preview {
//    CarRowView(car: Car(make: "Mercedes", model: "cle200", year: 2024, fuel_type: "gas", drive: "a", combination_mpg: 5), onAddButtonTapped: <#() -> Void#>)
//}
