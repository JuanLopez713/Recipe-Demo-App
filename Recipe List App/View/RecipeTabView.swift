//
//  RecipeTabView.swift
//  Recipe App
//
//  Created by Juan Lopez on 9/25/22.
//

import SwiftUI

struct RecipeTabView: View {
    @State var tabTag = 0
    var body: some View {
        TabView(selection: $tabTag) {
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }.tag(0)

            RectangleCardView().tabItem {
                VStack {
                    Image(systemName: "repeat.1.circle")
                    Text("Rectangle")
                }
            }
            .tag(1)
            RecipeListView().tabItem {
                VStack {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
            }.tag(2)
            SettingsView().tabItem{
                VStack{
                    Image(systemName: "gearshape")
                }
            }.tag(3)
        }
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
