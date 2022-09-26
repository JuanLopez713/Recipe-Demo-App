//
//  SettingsView.swift
//  Recipe App
//
//  Created by Juan Lopez on 9/25/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var recipeList: RecipeModel
    var body: some View {
        VStack {
            Toggle("Show Ingredients:", isOn: $recipeList.showIngredients)
                .padding(25).foregroundColor(.red)
            Toggle("Show Directions:", isOn: $recipeList.showDirections)
                .padding(25)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(RecipeModel())
    }
}
