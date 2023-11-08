//
//  CardView.swift
//  FetchRecipe
//
//  Created by Matthew Lee on 11/8/23.
//
//  Individual View for each Dessert Recipe
//  Kingfisher is used for quick rendering of images

import SwiftUI
import Kingfisher

struct CardView: View {
    var image: String
    var title: String
    
    var body: some View {
        HStack {
            KFImage(URL(string: image))             // Quick rendering of images instead of asyncimage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
            
            VStack {
                Text(title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }.padding(.trailing, 20)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color(red: 104/255, green: 106/255, blue: 108/255))
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.15), radius: 20)
        .padding(.all, 5)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: "https://via.placeholder.com/100", title: "Sample Dessert")
    }
}
