//
//  DessertsDetailsVM.swift
//  FetchRecipe
//
//  Created by Matthew Lee on 11/8/23.
//

import Foundation

class DessertDetailsVM: ObservableObject {
    @Published var dessertDetails: DessertDetail?
    
    // Retrieve Data from API
    func loadDessertDetails(dessertID: String) {
        // Start Retreiving data from API
        print("Retrieving \(dessertID) dessert from API: https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(dessertID)")
        let urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(dessertID)"
        
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
                        if let jsonString = String(data: data, encoding: .utf8) {
                            print(jsonString)
                        }
                        let decoded = try JSONDecoder().decode(DessertDetailResponse.self, from: data)
                        print("decoded: \(decoded)")
                        self.dessertDetails = decoded.meals.first
                    } catch {
                        print("Error Decoding JSON: \(error.localizedDescription)")
                        
                        if let decodingError = error as? DecodingError {
                                switch decodingError {
                                case .typeMismatch(let type, let context):
                                    print("Type Mismatch:", type, context)
                                case .valueNotFound(let type, let context):
                                    print("Value not found:", type, context)
                                case .keyNotFound(let key, let context):
                                    print("Key not found:", key.stringValue, context)
                                case .dataCorrupted(let context):
                                    print("Data corrupted:", context)
                                @unknown default:
                                    print("Unknown decoding error:", decodingError)
                                }
                            }
                    }
                }
            }
        }.resume()
    }
}
