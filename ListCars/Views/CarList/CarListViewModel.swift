//
//  CarListViewModel.swift
//  ListCars
//
//  Created by Emir Fatih AYYILDIZ on 8.01.2024.
//

import Foundation

class CarListViewModel: ObservableObject {

    @Published var isLoading = true
    @Published var carList: [Car] = []
    private var dataSource = CarDataSource()
    var viewModel = HomeViewModel()
    
    
    init() {
        dataSource.delegate = self
    }

    func loadCarList(make:String) {
        dataSource.loadCarList(forMake: make)
    }
}

extension CarListViewModel: CarDataSourceDelegate {
    func fetchError(error: Error) {
        _=true
    }
    

    func carListLoaded(carList: [Car]) {
        isLoading = false
        self.carList = carList
    }
}
