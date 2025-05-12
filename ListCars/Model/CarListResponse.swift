//
//  CarListResponse.swift
//  ListCars
//
//  Created by Emir Fatih AYYILDIZ on 9.01.2024.
//

import Foundation

struct CarListResponse: Decodable {
    let message: [Car]
}
