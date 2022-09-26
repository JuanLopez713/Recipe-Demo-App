//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Juan Lopez on 9/24/22.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: Image

                Image(recipe.image).resizable().scaledToFill()

                // MARK: Ingredients

                VStack(alignment: .leading) {
                    Text("Ingredients").font(.headline).padding(.vertical, 5)
                    ForEach(recipe.ingredients) { ingredient in

                        Text("• " + ingredient.name)
                            .padding(.bottom, 3.0)
                    }
                }
                .padding(.horizontal)

                // MARK: Directions

                VStack(alignment: .leading) {
                    Text("Directions").font(.headline).padding(.vertical, 5)

                    ForEach(0 ..< recipe.directions.count, id: \.self) { index in

                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom, 3.0)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
        }.navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let recipeList = RecipeModel()
        RecipeDetailView(recipe: recipeList.recipes[0])
    }
}
