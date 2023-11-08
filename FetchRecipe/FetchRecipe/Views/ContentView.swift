//
//  ContentView.swift
//  FetchRecipe
//
//  Created by Matthew Lee on 11/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            DessertListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
