//
//  NewTask.swift
//  TodoVer2
//
//  Created by 坪田和樹 on 2022/01/21.
//

import SwiftUI

struct EditTask: View {
    
    @ObservedObject var todo: TodoEntity
    
    var categories: [TodoEntity.Category]
    = [.ImpUrg_1st, .ImpNUrg_2nd, .NImpUrg_3rd, .NImpNUrg_4th]
    @Environment(\.managedObjectContext) var viewContext
    
    fileprivate func save() {
        do {
            try self.viewContext.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    fileprivate func delete() {
        viewContext.delete(todo)
        save()
    }
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            Section(header: Text("タスク").foregroundColor(.black)){
                TextField("タスクを入力", text: Binding($todo.task, "new task")).foregroundColor(.gray)
            }
            Section(header: Toggle(isOn: Binding(isNotNil: $todo.time, defaultValue: Date())){Text("時間を指定する").foregroundColor(.secondary)}) {
                if todo.time != nil {
                    DatePicker(selection: Binding($todo.time, Date()), label: {Text("日時").foregroundColor(.black)})
                } else {
                    Text("時間未設定").foregroundColor(.secondary)
                }
                
            }
            Picker(selection: $todo.category, label: Text("種類").foregroundColor(.black)){
                ForEach(categories, id: \.self) { category in
                    HStack {
                        CategoryImage(category)
                        Text(category.toString()).foregroundColor(.gray)
                    }.tag(category.rawValue)
                }
            }
            Section(header: Text("操作").foregroundColor(.gray)){
                Button(action: {
                    // 後で実装
                }) {
                    HStack {
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(.red)
                        Text("Delete")
                            .foregroundColor(.red)
                    }
                }
            }
        }.navigationTitle("タスクの編集")
            .navigationBarItems(trailing: Button(action: {
                self.save()
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("閉じる")
                    .foregroundColor(.blue)
            })
        
    }
}

struct EditTask_Previews: PreviewProvider {
    static let context = PersistenceController.shared.container.viewContext
    static var previews: some View {
        let newTodo = TodoEntity(context: context)
        return NavigationView {
            EditTask(todo: newTodo)
                .environment(\.managedObjectContext, context)
        }
        
    }
}
