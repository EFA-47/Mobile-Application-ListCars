//
//  HomeView.swift
//  ListCars
//
//  Created by Emir Fatih AYYILDIZ on 8.01.2024.
//

import SwiftUI

struct HomeView: View {

    @StateObject private var viewModel = HomeViewModel()
    @State private var inputText = ""
    @State private var favList: [Car] = []
    @StateObject var dataManager = DataManager()
    var body: some View {
        
        
        NavigationStack {
            VStack{
                TextField("Enter brand name", text: $inputText)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                HStack{
                    Spacer()
                    NavigationLink(destination: CarListView(passedText: $inputText, favList: $favList)) {
                        LinkText(text: viewModel.searchTitle)
                    }
                    Spacer()
                    NavigationLink(destination: LikedCarsView(favList: $favList).environmentObject(dataManager)) {
                        LinkText(text: viewModel.likedTitle)
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}

