//
//  RecipeHighlights.swift
//  Recipe App
//
//  Created by Juan Lopez on 9/26/22.
//

import SwiftUI

struct RecipeHighlights: View {
    var allHighlights = ""
    var body: some View {
        Text(allHighlights)
        
    }
    
    init(highlights:[String]){
        //Loop through the highlights and build the string
        for index in 0..<highlights.count {
            //If this is the last item, don't add comma
            if index == highlights.count-1 {
                allHighlights += highlights[index]
            }else{
                allHighlights += highlights[index] + ", "
            }
        }
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        let recipeList = RecipeModel()
        
        RecipeHighlights(highlights: recipeList.recipes[0].highlights)
    }
}
