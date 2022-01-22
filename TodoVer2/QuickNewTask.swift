//
//  QuickNewTask.swift
//  TodoVer2
//
//  Created by 坪田和樹 on 2022/01/16.
//

import SwiftUI

struct QuickNewTask: View {
    let category: TodoEntity.Category
    
    @State var newTask: String = ""
    // データベース操作
    @Environment(\.managedObjectContext) var viewContext
    
    fileprivate func addNewTask() {
        // データ追加
        TodoEntity.create(in: self.viewContext, category: self.category, task: self.newTask)
        self.newTask = ""
    }
    
    fileprivate func cancelTask() {
        self.newTask = ""
    }
    
    var body: some View {
        HStack {
            TextField("新しいタスク", text: $newTask) {
                self.addNewTask()
            }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.blue)
            Button(action: {
                self.addNewTask()
            }) {
                Text("追加")
                    .foregroundColor(.blue)
            }
            Button(action: {
                self.cancelTask()
            }) {
                Text("Cancel")
                    .foregroundColor(.red)
            }
        }
    }
}

struct QuickNewTask_Previews: PreviewProvider {
    static let context = PersistenceController.shared.container.viewContext
    static var previews: some View {
        Group {
            QuickNewTask(category: .ImpUrg_1st)
            // DB操作
                .environment(\.managedObjectContext, context)
        }
    }
}
