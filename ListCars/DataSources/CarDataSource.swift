//
//  CarDataSource.swift
//  ListCars
//
//  Created by Emir Fatih AYYILDIZ on 8.01.2024.
//

import Foundation

struct CarDataSource {
    weak var delegate: CarDataSourceDelegate?

    func loadCarList(forMake: String) {
        let urlString = "https://api.api-ninjas.com/v1/cars?limit=50&make=\(forMake)"
        let apiKey = "IPmmE0p/G3URCAWtYlklPg==hhIGCtxE7IU1sut3"

        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.setValue(apiKey, forHTTPHeaderField: "X-Api-Key")

            let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data else {
                    print("No data received")
                    return
                }

                do {
                    print(response!)
                    var carList = try JSONDecoder().decode([Car].self, from: data)

                    // Add UUID as identifier for each car
                    carList = carList.map { car in
                        var mutableCar = car
                        mutableCar.id = UUID()
                        return mutableCar
                    }

                    DispatchQueue.main.async {
                        self.delegate?.carListLoaded(carList: carList)
                    }

                } catch {
                    print("Error decoding car list response: \(error)")
                    DispatchQueue.main.async {
                        self.delegate?.fetchError(error: error)
                    }
                }
            }
            dataTask.resume()
        }
    }

}
