//
//  CategoryImage.swift
//  TodoVer2
//
//  Created by 坪田和樹 on 2022/01/14.
//

import SwiftUI

struct CategoryImage: View {
    
    var category: TodoEntity.Category
    
    init(_ category: TodoEntity.Category?){
        self.category = category ?? .ImpUrg_1st
    }
    
    var body: some View {
        Image(systemName: category.image())
            .resizable()
            .scaledToFit()
            .foregroundColor(Color.white)
            .padding(2.0)
            .frame(width: 30, height: 30)
            .background(Color(hue: 0.659, saturation: 1.0, brightness: 1.0, opacity: 0.402))
            .cornerRadius(6.0)
    }
}

struct CategoryImage_Previews: PreviewProvider {
    static var previews: some View {
        CategoryImage(TodoEntity.Category.ImpUrg_1st)
    }
}
