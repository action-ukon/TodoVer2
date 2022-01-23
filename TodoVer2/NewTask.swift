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
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("タスク")){
                    TextField("タスクを入力", text: $task)
                }
                Section(header: Toggle(isOn: Binding(isNotNil: $time, defaultValue: Date())){Text("時間を指定する")}) {
                    if time != nil {
                        DatePicker(selection: Binding($time, Date()), label: {Text("日時")})
                    } else {
                        Text("時間未設定").foregroundColor(.secondary)
                    }
                    
                }
                Section(header: Text("操作")){
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.red)
                            Text("キャンセル")
                                .foregroundColor(.red)
                        }
                    }
                }
            }.navigationTitle("タスクの追加")
        }
    }
}

struct NewTask_Previews: PreviewProvider {
    static var previews: some View {
        NewTask()
    }
}
