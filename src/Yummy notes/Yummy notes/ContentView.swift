//
//  ContentView.swift
//  Yummy notes
//
//  Created by Knapp Tania on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    let recipeItems = Bundle.main.decode([Recipe].self, from: "example.json")
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(recipeItems, id: \.self) { item in
                        NavigationLink {
                            RecipeScreenView(recipe: item)
                        } label: {
                            HStack {
                                RecipeItemView(image: item.image_url, name: item.name)
                                Image(systemName: "chevron.right")
                            }
                        }
                        
                    }
                    .padding()
                    .navigationTitle("Вкусные записки")
                    .navigationBarTitleDisplayMode(.inline)
                    .foregroundColor(.indigo)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
