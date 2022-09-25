//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Juan Lopez on 9/24/22.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    init() {
        // parse the local json file
        recipes = DataService.getLocalData()
    }
}
