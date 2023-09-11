//
//  Structures.swift
//  QingFood
//
//  Created by 吴卓航 on 2023/5/29.
//

import Foundation

struct FoodIntroduction: Hashable, Codable, Identifiable{
    var id: Int
    var name: String
    var calories: Int
    var level: String
    var description: String
    
    var category: Category
    enum Category: String, Codable, CaseIterable{
        case empty = "empty"
        case fruit = "fruit"
        case staple_food = "StapleFood"
        case cuisine = "cuisines"
        case vegetable = "vegetable"
        case protein = "protein"
        case nuts = "nuts"
    }
}

struct Card : Hashable ,Codable, Identifiable {
    var id : Int
    var image : String
    var title : String
    var descrip : String
    var stars : Int
    var price : String
    var expand : Bool
}

struct BoardingPage : Hashable ,Codable, Identifiable {
    var id : Int
    var image : String
    var title : String
    var descrip : String
}

struct Ingredent : Hashable, Codable, Identifiable {
    var id: Int
    var image: String
    var name: String
}
