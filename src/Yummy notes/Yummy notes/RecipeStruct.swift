//
//  RecipeStruct.swift
//  Yummy notes
//
//  Created by Knapp Tania on 1/29/24.
//

import Foundation

struct Recipe: Codable, Hashable {
    let name: String
    let image_url: String
    let steps: [Step]
}

struct Step: Codable, Hashable {
    let ingredients: [Ingredient]
    let number: Int
    let step: String
}

struct Ingredient: Codable, Hashable {
    let id: Int
    let name: String
}
