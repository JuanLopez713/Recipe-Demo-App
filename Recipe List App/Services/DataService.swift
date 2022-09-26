//
//  DataService.swift
//  Recipe List App
//
//  Created by Juan Lopez on 9/24/22.
//

import Foundation

class DataService {
    static func getLocalData() -> [Recipe] {
        // Parse local JSON file

        // Get a url path to JSON File
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")

        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }

        // Create a url object
        let url = URL(fileURLWithPath: pathString!)

        do {
            // Create a data object
            let data = try Data(contentsOf: url)

            let decoder = JSONDecoder()
            do {
                // Decode the data with a JSON decoder

                let recipeData = try decoder.decode([Recipe].self, from: data)
                // Add the unique IDs to each recipe
                for r in recipeData {
                    r.id = UUID()
                    
                    // Add the unique IDs to each ingredient
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                // Return the recipes
                return recipeData
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        return [Recipe]()
    }
}
