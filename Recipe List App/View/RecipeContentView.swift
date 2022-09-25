//
//  RecipeContentView.swift
//  Recipe List App
//
//  Created by Juan Lopez on 9/24/22.
//

import SwiftUI

struct RecipeContentView: View {
    // Reference the recipe model
    @ObservedObject var recipeList = RecipeModel()
    var body: some View {
        Text("Hello")
        NavigationView {
            List(recipeList.recipes) { r in
                NavigationLink(destination: RecipeDetailView(recipe: r), label: {
                    // MARK: Row Item

                    HStack(spacing: 20.0) {
                        Image(r.image).resizable().scaledToFill().frame(width: 100, height: 100, alignment: .center).clipped().cornerRadius(5)
                        Text(r.name)
                    }
                })
            }
            .navigationBarTitle("All Recipes")
        }
    }
}

struct RecipeContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeContentView()
    }
}
