//
//  CarDataSourcesDelegate.swift
//  ListCars
//
//  Created by Emir Fatih AYYILDIZ on 8.01.2024.
//

import Foundation

protocol CarDataSourceDelegate: AnyObject {
    func carListLoaded(carList: [Car])
    func fetchError(error: Error)
}
