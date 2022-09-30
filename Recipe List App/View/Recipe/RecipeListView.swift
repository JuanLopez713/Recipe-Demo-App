//
//  RecipeContentView.swift
//  Recipe List App
//
//  Created by Juan Lopez on 9/24/22.
//

import SwiftUI

struct RecipeListView: View {
    // Reference the recipe model
//    @ObservedObject var recipeList = RecipeModel()
    @EnvironmentObject var recipeList: RecipeModel
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .padding(.top, 40.0)
                    .bold()
                    .font(Font.custom("Avenir Heavy", size: 24))
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
                                    VStack (alignment: .leading){
                                        Text(r.name)
                                            .foregroundColor(.black)
                                            .font(.title3)
                                            .bold()
                                        RecipeHighlights(highlights: r.highlights).foregroundColor(.black)
                                    }
                                   
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
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
