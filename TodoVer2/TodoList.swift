//
//  TodoList.swift
//  TodoVer2
//
//  Created by 坪田和樹 on 2022/01/16.
//

import SwiftUI
import CoreData

struct TodoList: View {
    
    // @FetchRequestデータベースからデータを取得
    // NSSortDescriptorデータ並び替え
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TodoEntity.time,
                                           ascending: true)],
        animation: .default)
    var todoList: FetchedResults<TodoEntity>
    
    @Environment(\.managedObjectContext) var viewContext
    
    fileprivate func deleteTodo(at offsets: IndexSet) {
        for index in offsets {
            let entity = todoList[index]
            viewContext.delete(entity)
        }
        do {
            try viewContext.save()
        } catch {
            print("Delete Error. \(offsets)")
        }
    }
    
    let category: TodoEntity.Category
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(todoList) {todo in
                        if todo.category == self.category.rawValue {
                            //NavigationLink(destination他のファイル見にいく
                            NavigationLink(destination: EditTask(todo: todo)) {
                                TodoDetailRow(todo: todo, hideIcon: true)
                            }
                        }
                    }.onDelete(perform: deleteTodo)
                }
                QuickNewTask(category: category)
                .padding()
            }.navigationBarTitle(category.toString())
                .navigationBarItems(trailing: EditButton())
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    
    static let container = PersistenceController.shared.container
    static let context = container.viewContext
    
    static var previews: some View {
        // テストデータの全削除
        let request = NSBatchDeleteRequest(
            fetchRequest: NSFetchRequest(entityName: "TodoEntity"))
        try! container.persistentStoreCoordinator.execute(request,
                                                          with: context)
        
        // データを追加
        TodoEntity.create(in: context,
                          category: .ImpUrg_1st, task: "炎上プロジェクト")
        TodoEntity.create(in: context,
                          category: .ImpNUrg_2nd, task: "自己啓発")
        TodoEntity.create(in: context,
                          category: .NImpUrg_3rd, task: "意味のない会議")
        TodoEntity.create(in: context,
                          category: .NImpNUrg_4th, task: "暇つぶし")
        
        return TodoList(category: .ImpUrg_1st)
            .environment(\.managedObjectContext, context)
    }
}
