//
//  CategoryView.swift
//  TodoVer2
//
//  Created by 坪田和樹 on 2022/01/16.
//

import SwiftUI

struct CategoryView: View {
    var category: TodoEntity.Category
    @State var numberOfTasks = 0
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Image(systemName: category.image())
                    .font(.largeTitle)
                Text(category.toString())
                Text("・\(numberOfTasks)タスク")
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                Spacer()
            }
                .padding()
                .frame(maxWidth: .infinity, minHeight: 150)
                .foregroundColor(.white)
                .background(category.color())
                .cornerRadius(20)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            CategoryView(category: .ImpUrg_1st,
                         numberOfTasks: 100)
            CategoryView(category: .ImpNUrg_2nd)
            CategoryView(category: .NImpUrg_3rd)
            CategoryView(category: .NImpNUrg_4th)
        }
        
    }
}
