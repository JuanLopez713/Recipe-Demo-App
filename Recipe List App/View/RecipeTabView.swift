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
            MenuView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Order")
                    }
                }.tag(0)
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }.tag(1)

            RectangleCardView().tabItem {
                VStack {
                    Image(systemName: "repeat.1.circle")
                    Text("Rectangle")
                }
            }
            .tag(2)
            RecipeListView().tabItem {
                VStack {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
            }.tag(3)
            SettingsView().tabItem {
                VStack {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
            }.tag(4)
        }
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
