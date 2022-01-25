//
//  TaskToday.swift
//  TodoVer2
//
//  Created by 坪田和樹 on 2022/01/25.
//

import SwiftUI

struct TaskToday: View {
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TodoEntity.time,
                                           ascending: true)],
        predicate: NSPredicate(format:"time BETWEEN {%@ , %@}", Date.today as NSDate, Date.tomorrow as NSDate),
        animation: .default)
     var todoList: FetchedResults<TodoEntity>

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("今日のタスク").font(.footnote).bold().padding()
            List(todoList) { todo in
                TodoDetailRow(todo:  todo)
            }
        }.background(Color(UIColor.systemBackground))
            .cornerRadius(10.0)
    }
}

struct TaskToday_Previews: PreviewProvider {
    static let context = PersistenceController.shared.container.viewContext
    
    static var previews: some View {
        TaskToday()
            .environment(\.managedObjectContext, context)
    }
}
