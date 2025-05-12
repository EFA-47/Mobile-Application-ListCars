//
//  CarDetailView.swift
//  ListCars
//
//  Created by Emir Fatih AYYILDIZ on 9.01.2024.
//

import SwiftUI

struct CarDetailView: View {
    let car: Car

    var body: some View {
        VStack {
            Text("Brand: \(car.make)")
            Text("Model: \(car.model)")
            Text("Year: \(car.year)")
            Text("Fuel Type: \(car.fuel_type)")
            Text("Drive: \(car.drive)")
            Text("MPG: \(car.combination_mpg)")

            // Add more details as needed
        }
        .padding()
        .navigationBarTitle("Car Details", displayMode: .inline)
    }
}
