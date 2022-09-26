//
//  RecipeContentView.swift
//  Recipe List App
//
//  Created by Juan Lopez on 9/24/22.
//

import SwiftUI

struct RecipeContentView: View {
    // Reference the recipe model
//    @ObservedObject var recipeList = RecipeModel()
    @EnvironmentObject var recipeList: RecipeModel
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .padding(.top, 40.0)
                    .font(.largeTitle)
                    .bold()
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(recipeList.recipes) { r in
                            NavigationLink(destination: RecipeDetailView(recipe: r), label: {
                                // MARK: Row Item

                                HStack(spacing: 20.0) {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 75, height: 75, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    Text(r.name).foregroundColor(.black)
                                }
                            })
                        }
                    }
                }

//                List(recipeList.recipes) {
//                }
            }

            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct RecipeContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeContentView()
            .environmentObject(RecipeModel())
    }
}
