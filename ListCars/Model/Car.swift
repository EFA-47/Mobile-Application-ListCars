//
//  Car.swift
//  ListCars
//
//  Created by Emir Fatih AYYILDIZ on 8.01.2024.
//

import Foundation

struct Car: Identifiable, Decodable, Hashable {
    var id: UUID? = UUID()
    var make: String
    var model: String
    var year: Int
    var fuel_type: String
    var drive: String
    let combination_mpg: Int
}
