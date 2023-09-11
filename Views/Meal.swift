//
//  Meal.swift
//  QingFood
//
//  Created by 吴卓航 on 2023/5/26.
//

import SwiftUI

struct Meal: View {
    @State private var isLike = false
    @State private var quantity = 0
    @State var meal : Card
    @State var heart = "heart.fill"
    var placeHolder = "尝试我们的精心准备的轻食套餐，为您提供美味与健康的完美结合！我们的轻食套餐专门设计为那些追求身体健康和控制体重的人士。每一道菜都精选优质的食材，并经过精心烹饪，以满足您对美食的渴望，同时不给身体增添过多的热量和脂肪。我们的轻食套餐提供丰富的营养，包括新鲜的水果、蔬菜、高蛋白质的鱼类和鸡肉，以及富含纤维的全谷物。这些食物有助于提供身体所需的能量，并保持肌肉、骨骼和免疫系统的健康。无论您是想减肥还是维持健康的体重，我们的轻食套餐都能满足您的需求。我们精确控制了每道菜的卡路里和脂肪含量，确保您能够享受美味的同时不担心增加体重。选择我们的轻食套餐，您将享受到美味和健康的完美结合。让我们的食物满足您的味蕾，同时为您带来更好的身体和精神健康。开始您的轻食之旅，感受焕然一新的活力和健康吧！"
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false, content: {
                GeometryReader{reader in
                    Image(meal.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        
                        .offset(y: -reader.frame(in: .global).minY)
                        // going to add parallax effect....
                        .frame(width: UIScreen.main.bounds.width, height:  reader.frame(in: .global).minY + 300)
                    
                }
                .frame(height: 280)
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text(meal.title)
                        .font(.system(size: 35, weight: .bold))
                    
                    
                    HStack(spacing: 10){
                        
                        ForEach(1..<5){_ in
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                    
                    HStack {
                        Text(meal.descrip)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.top,5)
                        Spacer()
                        
                        Button{
                            withAnimation {
                                isLike.toggle()
                            }
                        } label: {
                            Label("Like", systemImage: isLike ? "heart.fill" : "heart")
                                .labelStyle(.iconOnly)
                                .font(.system(size: 30))
                        }
                        .foregroundColor(.red)
                        .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                    
                    
                    Text("Description")
                        .font(.system(size: 25, weight: .bold))
                    
                    Text(placeHolder)
                        .padding(.top, 10)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    
                    HStack {
                        Text("Quantity ")
                            .font(.title3)
                            .bold()
                        Spacer()
                        
                        Text("\(quantity)")
                        Stepper("",
                                onIncrement: {
                                    quantity+=1
                                }, onDecrement: {
                                    if(quantity > 0){
                                        quantity -= 1
                                    }
                                    else{
                                        quantity = 0
                                    }
                                })
                            .foregroundColor(.black)
                            .background(Color.white)
                            .frame(width: 100)
                            
                    }.padding(.top, 10)
                    
                    
                    HStack {
                        Text("Price ")
                            .font(.title3)
                            .bold()
                        Spacer()
                        Text("$\(quantity * 3).00")
                            .font(.title2)
                            .bold()
                    }
                    .padding(.top, 10)
                }
                .padding(.top, 25)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(20)
                .offset(y: -35)
            })
            
            
            Spacer()
            
            HStack{
                Spacer()
                Button(action: {}, label: {
                    Text("Add to Cart")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 100)
                        .background(Color.red)
                        .cornerRadius(10)
                    
                })
                Spacer()
            }
            .padding(.all, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            .edgesIgnoringSafeArea(.all)
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
    
}

struct Meal_Previews: PreviewProvider {
    static var previews: some View {
        Meal(meal: TrendingCard[0])
    }
}
