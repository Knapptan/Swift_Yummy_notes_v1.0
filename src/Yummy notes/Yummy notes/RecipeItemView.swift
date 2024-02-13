//
//  RecipeItemView.swift
//  Yummy notes
//
//  Created by Knapp Tania on 1/29/24.
//

import SwiftUI

struct RecipeItemView: View {
    
    var image: String
    var name: String
    
    var body: some View {
        VStack {
            HStack{
                Image(image)
                    .resizable()
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                    .padding(5)
                Text(name)
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                Spacer()
            }
            Divider()
        }
    }
}

struct RecipeItemView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeItemView(image: "borsch", name: "Борщ")
            .padding()
            .previewLayout(.sizeThatFits)
        
    }
}
