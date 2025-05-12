//
//  LikedCarsView.swift
//  ListCars
//
//  Created by Emir Fatih AYYILDIZ on 9.01.2024.
//

import SwiftUI

struct LikedCarsView: View {
    @ObservedObject private var viewModel = LikedCarsViewModel()
    @State private var selectedCar: Car?

    @EnvironmentObject var dataManager: DataManager
    @Binding var favList: [Car]

    var body: some View {
        NavigationView {
            List(dataManager.cars, id: \.self) { car in
                CarRowView(car: car) {
                    // Remove the selected car from the favList
                    favList.removeAll { $0.id == car.id }
                    dataManager.removeCar(carID: "\(String(describing: car.id))")
                }
                .onTapGesture {
                    selectedCar = car
                }
            }
            .navigationTitle("Liked Cars")
            .sheet(item: $selectedCar) { car in
                CarDetailView(car: car)
            }
        }
    }
}
