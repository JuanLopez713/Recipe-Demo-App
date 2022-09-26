//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Juan Lopez on 9/24/22.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var showIngredients = true
    @Published var showDirections = true
    @Published var recipes = [Recipe]()
    init() {
        // parse the local json file
        recipes = DataService.getLocalData()
    }

    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServing: Int) -> String {
        var portion = ""

        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denum ?? 1

        var wholePortions = 0

        if ingredient.num != nil {
            // Get a single serving size by multiplyign denominator by the recipe servings
            denominator *= recipeServings
            // Get target portion by multiplying numerator by target servings
            numerator *= targetServing

            // Reduce fraction by greatest common divisor
            let divisor = greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            // Get the whole portion if numerator -> denominator
            if numerator >= denominator {
                // Calculate whole portions
                wholePortions = numerator / denominator
                // Calculate the remainder
                numerator = numerator % denominator

                // Assign to portion String
                portion += String(wholePortions)
            }
            // Express the remainder as a fraction
            if numerator > 0 {
                // Assign remainder as fraction to teh portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator) / \(denominator)"
            }
        }
        if var unit = ingredient.unit {
           
            // Calculate appropriate suffix
            if wholePortions > 1 {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                   
                } else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                } else {
                    unit += "s"
                }
            }

            portion += ingredient.num == nil && ingredient.denum == nil ? "" : " "

            return portion + unit
        }

        return portion
    }

    static func greatestCommonDivisor(_ a: Int, _ b: Int) -> Int {
        // GCD(0,b)=b
        if a == 0 {
            return b
        }

        if b == 0 {
            return a
        }

        return greatestCommonDivisor(b, a % b)
    }
}
