//
//  OnBoarding.swift
//  QingFood
//
//  Created by 吴卓航 on 2023/5/26.
//

import SwiftUI
import UIKit

struct OnBoarding: View {

    @State var showSheetView = false
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .green
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        }
    var body: some View {
        NavigationView {
            pages()
        }.sheet(isPresented: $showSheetView) {
            Location()
        }.animation(.easeInOut)
    }
    
}



struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}


