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
            // TodoEntityの以下のrawValue Binding<Bool>
            // enum State: Int16 {
                //case todo
                //case done 完了
            //}
            CheckBox(checked: Binding(get: {
                self.todo.state == TodoEntity.State.done.rawValue
            }, set: {
                self.todo.state = $0 ? TodoEntity.State.done.rawValue : TodoEntity.State.todo.rawValue
            })) {
                if self.todo.state == TodoEntity.State.done.rawValue {
                    Text(self.todo.task ?? "no title").strikethrough()
                }else {
                    Text(self.todo.task ?? "no title")
                }
            }.foregroundColor(self.todo.state == TodoEntity.State.done.rawValue
                              ? .secondary : .primary)
        }
    }
}

struct TodoDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        
        let newTodo = TodoEntity(context: context)
        newTodo.task = "将来への人間関係づくり"
        newTodo.state = TodoEntity.State.todo.rawValue
        newTodo.category = 0
        
        return TodoDetailRow(todo: newTodo)
    }
}
