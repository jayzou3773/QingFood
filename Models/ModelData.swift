//
//  ModelData.swift
//  QingFood
//
//  Created by 吴卓航 on 2023/4/19.
//

import Foundation

var FoodTypes = ["Pizza","Drinks","Tacos","Burger","Fries","Top"]
var FoodInfo: [FoodIntroduction] = load("CaloriesInfo.json")
var TrendingCard: [Card] = load("CardInfo.json")
var BoardingData: [BoardingPage] = load("Boarding.json")
var IngredientInfo: [Ingredent] = load("Ingredient.json")

//从json文件中读取数据
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }//找到filename的文件
    
    do {//读取
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {//解码并返回
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
