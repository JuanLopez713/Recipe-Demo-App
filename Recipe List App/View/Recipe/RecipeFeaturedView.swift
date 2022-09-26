//
//  RecipeFeaturedView.swift
//  Recipe App
//
//  Created by Juan Lopez on 9/25/22.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var recipeList: RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            Text("Featured Recipes")
                .padding(.leading, 20.0)
                .padding(.top, 40.0)
                .font(.largeTitle)
                .bold()
            GeometryReader { geo in
                TabView(selection: $tabSelectionIndex) {
                    // Loop through each recipe
                    ForEach(0 ..< recipeList.recipes.count, id: \.self) { index in
                        // Only show those that should be featured
                        if recipeList.recipes[index].featured == true {
                            // Recipe Card button
                            Button(action: {
                                // Show the recipe detail
                                self.isDetailViewShowing = true
                                print(index)
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)

                                    VStack(spacing: 0) {
                                        Image(recipeList.recipes[index].image)
                                            .resizable()
                                            .clipped()
                                            .aspectRatio(contentMode: .fill)
                                        Text(recipeList.recipes[index].name)
                                            .padding(5)
                                    }
                                }
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing) {
                                // Show recipe detail view

                                RecipeDetailView(recipe: recipeList.recipes[tabSelectionIndex])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(20)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: 5, y: 5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
            }
            VStack(alignment: .leading, spacing: 10.0) {
                Text("Preparation Time").font(.headline)
                Text(recipeList.recipes[tabSelectionIndex].prepTime)
                Text("Highlight").font(.headline)
                RecipeHighlights(highlights: recipeList.recipes[tabSelectionIndex].highlights)

            }.padding([.leading, .bottom], 20.0)
        }
        .onAppear {
            setFeaturedIndex()
        }
    }

    func setFeaturedIndex() {
        // Find the first recipe that is featured
        let index = recipeList.recipes.firstIndex { recipe -> Bool in
            recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
