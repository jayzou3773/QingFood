//
//  CaloriesList.swift
//  QingFood
//
//  Created by 吴卓航 on 2023/5/29.
//

import SwiftUI

struct CaloriesList: View {
    @State var item: FoodIntroduction
    
    var body: some View {
        ScrollView {
            Text("Detail")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .padding()
            
            if(item.category.rawValue == "empty"){
                Text("Not found, maybe it's not a kind of food.")
            }
            else {
                HStack {
                    VStack (alignment: .leading){
                        Text(item.name)
                            .font(.largeTitle)
                        Text("\(item.calories) calories per 100g")
                    }.padding()
                    Spacer()
                    Divider()
                    Spacer()
                    Text("Level: \(item.level)")
                }.padding()
                        
                Text("    \(item.description)")
                    .font(.title3)
                    .padding()
            }
            
        }
    }
}

struct CaloriesList_Previews: PreviewProvider {
    static var previews: some View {
        CaloriesList(item: FoodInfo[1])
    }
}
