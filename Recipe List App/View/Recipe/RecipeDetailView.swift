//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Juan Lopez on 9/24/22.
//

import SwiftUI

struct RecipeDetailView: View {
    @EnvironmentObject var recipeList: RecipeModel
    @State var servingSelection = 2
    var recipe: Recipe

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading) {
                    // MARK: Recipe Image

                    Image(recipe.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height / 4)
                        .clipped()

                    // MARK: Recipe Name

                    Text(recipe.name)
                        .font(Font.custom("Avenir Heavy", size: 24))
                        .bold()
                        .padding([.leading, .trailing], 20)
                        .padding(.bottom, 5)

                    // MARK: Serving Size Picker

                    VStack(alignment: .leading) {
                        Text("Serving Size").font(.headline)
                        Picker("Serving Size", selection: $servingSelection) {
                            Text("2").tag(2)
                            Text("4").tag(4)
                            Text("6").tag(6)
                            Text("8").tag(8)
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                    .padding([.leading, .bottom, .trailing], 20.0)

                    // MARK: Ingredients

                    if recipeList.showIngredients {
                        VStack(alignment: .leading) {
                            Text("Ingredients")
                                .font(Font.custom("Avenir Heavy", size: 16))
                                .padding(.vertical, 5)
                            ForEach(recipe.ingredients) { ingredient in

                                Text("• " + RecipeModel.getPortion(ingredient: ingredient, recipeServings: recipe.servings, targetServing: servingSelection) + " " + ingredient.name.lowercased())
                                    .padding(.bottom, 3.0)
                            }
                        }.padding(.horizontal, 20)
                    }

                    // MARK: Directions

                    if recipeList.showDirections {
                        VStack(alignment: .leading) {
                            Text("Directions").font(Font.custom("Avenir Heavy", size: 16))
                                .padding(.vertical, 5)

                            ForEach(0 ..< recipe.directions.count, id: \.self) { index in

                                Text(String(index + 1) + ". " + recipe.directions[index])
                                    .padding(.bottom, 3.0)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                }

                // .cornerRadius(20)
                // .shadow(radius: 20)
            }.navigationBarTitle(recipe.name)
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let recipeList = RecipeModel()
        RecipeDetailView(recipe: recipeList.recipes[1])
            .environmentObject(RecipeModel())
    }
}
