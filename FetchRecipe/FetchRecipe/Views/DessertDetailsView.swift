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
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                if let detail = detailVM.dessertDetails {
                    ImageSection(imageURL: detail.strMealThumb)
                    TitleSection(mealName: detail.strMeal, category: detail.strCategory, area: detail.strArea)
                    InstructionsSection(instructions: detail.strInstructions)
                    IngredientsSection(ingredients: detail.ingredients, measures: detail.measures)
                } else {
                    ProgressView()
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            detailVM.loadDessertDetails(dessertID: dessertID)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // Image section
    struct ImageSection: View {
        var imageURL: String
        
        var body: some View {
            GeometryReader { geometry in
                KFImage(URL(string: imageURL))
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(25)
                    .frame(width: geometry.size.width, height: 300)
                    .clipped()
            }
            .padding(.top)
            .frame(height: 300)
        }
    }
    
    // Title section
    struct TitleSection: View {
        var mealName: String
        var category: String
        var area: String
        
        var body: some View {
            VStack(alignment: .leading) {
                // Title
                Text(mealName)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                
                // Origins
                Text("\(area) \(category)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
    
    // Instructions Section
    struct InstructionsSection: View {
        var instructions: String
        
        var body: some View {
            VStack(alignment: .leading) {
                Text("Instructions")
                    .font(.headline)
                    .padding(.top)
                    .padding(.bottom, 5)
                
                Text(instructions)
            }
        }
    }
    
    // Ingredients and Measures Section
    struct IngredientsSection: View {
        var ingredients: [String?]
        var measures: [String?]
        
        var body: some View {
            VStack(alignment: .leading) {
                Text("Ingredients")
                    .font(.headline)
                    .padding(.top)
                    .padding(.bottom, 5)
                
                ForEach(Array(zip(ingredients, measures)), id: \.0) { ingredient, measure in
                    if let ingredient = ingredient, let measure = measure, !ingredient.isEmpty, !measure.isEmpty {
                        HStack {
                            Text("• \(ingredient)")
                            Spacer()
                            Text(measure)
                        }
                    }
                }
            }
        }
    }
}

struct DessertDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailsView(dessertID: "")
    }
}
