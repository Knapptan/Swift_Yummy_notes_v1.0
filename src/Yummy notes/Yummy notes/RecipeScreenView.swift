//
//  RecipeScreenView.swift
//  Yummy notes
//
//  Created by Anton Krivonozhenkov on 29.01.2024.
//

import SwiftUI

struct RecipeScreenView: View {
    
    func convert(_ ing: [Ingredient]) -> String {
        var result: String = ""
        for (index, item) in ing.enumerated() {
            result = result + "\(index + 1). " + item.name + "\n"
        }
        
        return result
    }
    
    var recipe: Recipe
    @State private var selectedTab: Int = 0
    var body: some View {
        ScrollView {
            VStack {
                RecipeItemView(image: recipe.image_url, name: recipe.name)
                
                TabView(selection: $selectedTab) {
                    ForEach(recipe.steps, id: \.self) { step in
                        VStack {
                            Text(convert(step.ingredients))
                                .multilineTextAlignment(.leading)
                            
                            Text("Шаг № \(step.number)\n\n" + step.step)
                                .lineLimit(nil)
                                .padding(.horizontal, 5)
                                .multilineTextAlignment(.leading)
                            Spacer()
                            if step.number < recipe.steps.count {
                                Button {
                                    withAnimation {
                                        selectedTab = step.number + 1
                                    }
                                    
                                } label: {
                                    Text("Следующий шаг")
                                }
                            }
                            Spacer()

                        }
                        .tag(step.number)
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .frame(height: 500)
                
            }
            .navigationTitle(recipe.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RecipeScreenView(recipe: Recipe(name: "борщ", image_url: "borsch", steps: []))
}
