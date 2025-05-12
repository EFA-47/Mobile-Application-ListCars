//
//  HomeViewModel.swift
//  ListCars
//
//  Created by Emir Fatih AYYILDIZ on 8.01.2024.
//

import Foundation

class HomeViewModel: ObservableObject {

    @Published var searchTitle = "SEARCH"
    @Published var likedTitle = "Liked Cars"
    @Published var inputText = ""
}
