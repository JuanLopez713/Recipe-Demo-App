//
//  Ingredients.swift
//  Recipe App
//
//  Created by Juan Lopez on 9/25/22.
//

import Foundation
class Ingredient: Identifiable, Decodable{
    
    var id:UUID?
    var name:String
    var num:Int?
    var denum:Int?
    var unit:String?
    
}
