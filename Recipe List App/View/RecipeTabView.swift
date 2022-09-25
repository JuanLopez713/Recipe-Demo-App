//
//  RecipeTabView.swift
//  Recipe App
//
//  Created by Juan Lopez on 9/25/22.
//

import SwiftUI

struct RecipeTabView: View {
    @State var tabTag = 0;
    var body: some View {
        TabView (selection: $tabTag) {
            Text("Featured View")
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }.tag(0)
            Button("Take me to Recipes", action: {tabTag = 2}).tabItem{
                VStack{
                    Image(systemName: "star.fill")
                    Text("Demo")
                }
            }.tag(1)
            RecipeContentView().tabItem {
                VStack {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
            }.tag(2)
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
