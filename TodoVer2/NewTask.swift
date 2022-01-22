//
//  NewTask.swift
//  TodoVer2
//
//  Created by 坪田和樹 on 2022/01/21.
//

import SwiftUI

struct NewTask: View {
    @State var task: String = ""
    @State var time: Date = Date()
    var body: some View {
        NavigationView {
            Form {
                TextField("タスクを入力", text: $task)
                DatePicker(selection: $time, label: {Text("日時")})
                Button(action: {}) {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(.red)
                    Text("キャンセル")
                        .foregroundColor(.red)
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
