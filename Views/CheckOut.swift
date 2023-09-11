//
//  CheckOut.swift
//  QingFood
//
//  Created by 吴卓航 on 2023/5/29.
//

import SwiftUI

struct CheckOut: View {
    var body: some View {
        ScrollView{
            
            ZStack {
                Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
                    .frame(width: 600, height: 600)
                    .edgesIgnoringSafeArea(.all)
                    .cornerRadius(300)
                    .offset(x: -50, y: -350)
                Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
                    .frame(width: 300, height: 300)
                    .edgesIgnoringSafeArea(.all)
                    .cornerRadius(300)
                    .offset(x: -100, y: -250)

                VStack{
                    Text("Top Ingredient")
                        .fontWeight(.black)
                        .padding()
                        .font(.largeTitle)
                    
                    Image("chicken")
                        .resizable()
                        .frame(width: 64, height: 64, alignment: .center)
                    
                }
                .padding(.all, 20)
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width)
                .padding(.top, -250)
                
                
                }
            
            VStack {
                Text("玉米粒").font(.headline).padding()
                Text("鸡胸肉").font(.headline).padding()
                Text("西兰花").font(.headline).padding()
                Text("虾仁").font(.headline).padding()
                Text("紫薯").font(.headline).padding()
            }
            .offset(y:-300)
        }
            
        
        
        .edgesIgnoringSafeArea(.all)
    }
}

struct CheckOut_Previews: PreviewProvider {
    static var previews: some View {
        CheckOut()
    }
}
