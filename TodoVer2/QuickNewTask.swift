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
    
    fileprivate func addNewTask() {
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
            Button(action: {
                self.addNewTask()
            }) {
                Text("追加")
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
    static var previews: some View {
        Group {
            QuickNewTask(category: .ImpUrg_1st)
            QuickNewTask(category: .ImpUrg_1st)
            QuickNewTask(category: .ImpUrg_1st)
        }
    }
}
