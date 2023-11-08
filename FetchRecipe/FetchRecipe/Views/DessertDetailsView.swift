//
//  DessertDetailsView.swift
//  FetchRecipe
//
//  Created by Matthew Lee on 11/8/23.
//

import SwiftUI
import Kingfisher

struct DessertDetailsView: View {
    let dessertID: String
    @StateObject private var detailVM = DessertDetailsVM()
    
    var body: some View {
        VStack {
            if let detail = detailVM.dessertDetails {
                Text("Meal: \(detail.strMeal)")
                ScrollView {
                    VStack {
                        KFImage(URL(string: detail.strMealThumb))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width, height: 300)
                            .clipped()
        
                        Text(detail.strMeal)
                            .font(.title)
                            .padding(.top, 8)
                            .padding(.horizontal)
                    }
                }
            } else {
                // Loading Screen
                ProgressView()
            }
        }
        .onAppear {
            detailVM.loadDessertDetails(dessertID: dessertID)      // Call loadDessertDetails by dessertID
        }
    }
}

struct DessertDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailsView(dessertID: "")
    }
}
