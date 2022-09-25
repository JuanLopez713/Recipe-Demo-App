//
//  RecipeTabView.swift
//  Recipe App
//
//  Created by Juan Lopez on 9/25/22.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView {
            Text("Featured View")
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            RecipeContentView().tabItem {
                VStack {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
            }
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
