//
//  DessertListView.swift
//  FetchRecipe
//
//  Created by Matthew Lee on 11/8/23.
//
//  Views list of dessert recipes available

import SwiftUI

struct DessertListView: View {
    @StateObject var vm = DessertsVM()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(vm.desserts) { dessert in
                        CardView(image: dessert.strMealThumb, title: dessert.strMeal)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("🍰 FetchDesserts"))
        }
    }
}

struct DessertListView_Previews: PreviewProvider {
    static var previews: some View {
        DessertListView()
    }
}
