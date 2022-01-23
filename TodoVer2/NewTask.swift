//
//  NewTask.swift
//  TodoVer2
//
//  Created by 坪田和樹 on 2022/01/21.
//

import SwiftUI

struct NewTask: View {
    @State var task: String = ""
    @State var time: Date? = Date()
    @State var category: Int16 = TodoEntity.Category.ImpUrg_1st.rawValue
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
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("タスク").foregroundColor(.black)){
                    TextField("タスクを入力", text: $task).foregroundColor(.gray)
                }
                Section(header: Toggle(isOn: Binding(isNotNil: $time, defaultValue: Date())){Text("時間を指定する").foregroundColor(.secondary)}) {
                    if time != nil {
                        DatePicker(selection: Binding($time, Date()), label: {Text("日時").foregroundColor(.black)})
                    } else {
                        Text("時間未設定").foregroundColor(.secondary)
                    }
                    
                }
                Picker(selection: $category, label: Text("種類").foregroundColor(.black)){
                    ForEach(categories, id: \.self) { category in
                        HStack {
                            CategoryImage(category)
                            Text(category.toString()).foregroundColor(.gray)
                        }.tag(category.rawValue)
                    }
                }
                Section(header: Text("操作").foregroundColor(.gray)){
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.red)
                            Text("キャンセル")
                                .foregroundColor(.red)
                        }
                    }
                }
            }.navigationTitle("タスクの追加")
                .navigationBarItems(trailing: Button(action: {
                    TodoEntity.create(in: self.viewContext, category: TodoEntity.Category(rawValue: self.category) ?? .ImpUrg_1st, task: self.task, time: self.time)
                    self.save()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("保存")
                        .foregroundColor(.blue)
                })
        }
    }
}

struct NewTask_Previews: PreviewProvider {
    static let context = PersistenceController.shared.container.viewContext
    static var previews: some View {
        NewTask()
            .environment(\.managedObjectContext, context)
    }
}
