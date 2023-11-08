//
//  DessertVM.swift
//  FetchRecipe
//
//  Created by Matthew Lee on 11/6/23.
//
//  Fetching Data from API

import Foundation

class DessertVM: ObservableObject {
    @Published var desserts: [Dessert] = []
    @Published var errMsg: String?
    
    init() {
        loadDesserts()
    }
    
    // Retrieve Data from API
    func loadDesserts() {
        // Start Retreiving data from API
        print("Retrieving Dessert List from API: https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
        let urlString = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL: \(urlString)")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                    print("Error: data and response from API")
                } else if let data = data {
                    do {
                        let decoded = try JSONDecoder().decode(DessertResponse.self, from: data)
                        self.desserts = decoded.meals
                    } catch {
                        print("Error Decoding JSON: \(error.localizedDescription)")
                    }
                }
            }
        }.resume()
    }
}
