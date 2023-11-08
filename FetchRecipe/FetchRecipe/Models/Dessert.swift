//
//  Dessert.swift
//  FetchRecipe
//
//  Created by Matthew Lee on 11/8/23.
//
//  Defines dessert model

import Foundation

// Dessert Model
struct Dessert: Identifiable, Decodable {
    var id: String { idMeal }
    
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
}

struct DessertResponse: Decodable {
    let meals: [Dessert]
}
