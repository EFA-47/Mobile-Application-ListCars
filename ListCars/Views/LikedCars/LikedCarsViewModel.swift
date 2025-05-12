//
//  LikedCarsViewModel.swift
//  ListCars
//
//  Created by Emir Fatih AYYILDIZ on 9.01.2024.
//

import Foundation

class LikedCarsViewModel: ObservableObject {
    @Published var favList: [Car] = []
}
