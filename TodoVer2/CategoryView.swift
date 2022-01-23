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
    @State var showList = false
    @Environment(\.managedObjectContext) var viewContext
    @State var addNewtask = false
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Image(systemName: category.image())
                    .font(.largeTitle)
                // クロージャ　　シートの表示非表示を判断isPresented
                // $は同ファイルの値同期
                    .sheet(isPresented: $showList) {
                        TodoList(category: self.category)
                        //データベースを動作させる
                            .environment(\.managedObjectContext, self.viewContext)
                    }
                Text(category.toString())
                Text("・\(numberOfTasks)タスク")
                Button(action: {
                    self.addNewtask = true
                }) {
                    Image(systemName: "plus")
                    // めちゃ大事↓
                }.sheet(isPresented: $addNewtask) {
                    NewTask(category: self.category.rawValue)
                        .environment(\.managedObjectContext, self.viewContext)
                }
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 150)
            .foregroundColor(.white)
            .background(category.color())
            .cornerRadius(20)
            .onTapGesture {
                self.showList = true
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static let context = PersistenceController.shared.container.viewContext
    
    static var previews: some View {
        VStack{
            CategoryView(category: .ImpUrg_1st,
                         numberOfTasks: 100)
            CategoryView(category: .ImpNUrg_2nd)
            CategoryView(category: .NImpUrg_3rd)
            CategoryView(category: .NImpNUrg_4th)
        }.environment(\.managedObjectContext, context)
        
    }
}
