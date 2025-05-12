//
//  CarListView.swift
//  ListCars
//
//  Created by Emir Fatih AYYILDIZ on 8.01.2024.
//

import SwiftUI

struct CarListView: View {
    @StateObject private var viewModel = CarListViewModel()
    @State private var selectedCar: Car?
    @Binding var passedText: String
    @Binding var favList: [Car]

    var body: some View {
        Text("tap on name to add favourites")
        Text("press view to see details")
        NavigationView {
            if viewModel.isLoading {
                LoadingView()
                    .onAppear {
                        viewModel.loadCarList(make: passedText)
                    }
            } else {
                
                List(viewModel.carList, id: \.self) { car in
                    CarRowView(car: car) {
                        // Add the selected car to the favList
                        favList.append(car)
                        print("favList: \(favList)")

                    }
                    .onTapGesture {
                        selectedCar = car
                    }
                }
                .navigationTitle("Car List")
                .sheet(item: $selectedCar) { car in
                    CarDetailView(car: car)
                }
            }
        }
    }
}


//#Preview {
//    CarListView(passedText: $inputText = "bmw")
//}
