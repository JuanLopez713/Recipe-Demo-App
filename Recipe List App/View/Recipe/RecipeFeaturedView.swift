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
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            Text("Featured Recipes")
                .padding(.leading, 20.0)
                .padding(.top, 40.0)
                .font(.largeTitle)
                .bold()
            GeometryReader { geo in
                TabView {
                    // Loop through each recipe
                    ForEach(0 ..< recipeList.recipes.count, id: \.self) { index in
                        if recipeList.recipes[index].featured == true {
                            Button (action: {
                                //Show the recipe detail
                                self.isDetailViewShowing = true
                            }, label: {
                                ZStack {
                                    Rectangle().foregroundColor(.white)

                                    VStack(spacing: 0.0) {
                                        Image(recipeList.recipes[index].image)
                                            .resizable().clipped()
                                            .aspectRatio(contentMode: .fill)
                                        Text(recipeList.recipes[index].name).padding(5)
                                    }
                                }
                            })
                            .sheet(isPresented: $isDetailViewShowing, content: {
                                //Show recipe detail view
                                RecipeDetailView(recipe: recipeList.recipes[index])
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(20)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: 5, y: 5)
                        }
                                    
                    }
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            VStack(alignment: .leading, spacing: 10.0) {
                Text("Preparation Time").font(.headline)
                Text("1 hour")
                Text("Highlight").font(.headline)
                Text("Healthy, Hearty")

            }.padding([.leading, .bottom], 20.0)
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
