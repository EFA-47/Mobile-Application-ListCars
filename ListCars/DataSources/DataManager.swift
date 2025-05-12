//
//  DataManager.swift
//  ListCars
//
//  Created by Emir Fatih AYYILDIZ on 24.01.2024.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var cars: [Car] = []

    init() {
        fetchCars()
    }

    func fetchCars() {
        let db = Firestore.firestore()
        let ref = db.collection("Cars")

        ref.getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching cars: \(error.localizedDescription)")
                return
            }

            if let snapshot = snapshot {
                self.cars = snapshot.documents.compactMap { document in
                    let data = document.data()

//                    let id = data["id"] as? String ?? ""
                    let make = data["make"] as? String ?? ""
                    let model = data["model"] as? String ?? ""
                    let year = data["year"] as? Int ?? 0
                    let fuel_type = data["fuel_type"] as? String ?? ""
                    let drive = data["drive"] as? String ?? ""
                    let combination_mpg = data["combination_mpg"] as? Int ?? 0

                    return Car(make: make, model: model, year: year, fuel_type: fuel_type, drive: drive, combination_mpg: combination_mpg)
                }
            }
        }
    }

    func addCars(car: Car){
        let db = Firestore.firestore()
        let ref = db.collection("Cars").document("\(String(describing: car.id))")
        ref.setData(["make": car.make, "model": car.model, "year": car.year, "fuel_type": car.fuel_type, "drive": car.drive, "combination_mpg": car.combination_mpg]) {
            error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    func removeCar(carID: String) {
        let db = Firestore.firestore()
        let ref = db.collection("Cars").document(carID)

        ref.delete { error in
            if let error = error {
                print("Error removing car: \(error.localizedDescription)")
            } else {
                print("Car removed successfully!")
            }
        }
    }

}
