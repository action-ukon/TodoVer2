//
//  ToDetailRow.swift
//  TodoVer2
//
//  Created by 坪田和樹 on 2022/01/17.
//

import SwiftUI

struct TodoDetailRow: View {
    // stateのオブジェクト版
    // @State ひとつの変数だけを監視し、変更があれば画面に反映
    // @ObservedObject 変数が持つメンバに変更があれば画面に反映
    @ObservedObject var todo: TodoEntity
    var body: some View {
        HStack {
            CategoryImage(TodoEntity.Category(rawValue: todo.category))
            CheckBox(checked: .constant(true)) {
                Text(self.todo.task ?? "no title")
            }
        }
    }
}

struct TodoDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        
        let newTodo = TodoEntity(context: context)
        newTodo.task = "将来への人間関係づくり"
        newTodo.state = TodoEntity.State.done.rawValue
        newTodo.category = 0
        
        return TodoDetailRow(todo: newTodo)
    }
}
