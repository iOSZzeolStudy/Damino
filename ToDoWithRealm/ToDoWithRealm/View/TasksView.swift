//
//  TasksView.swift
//  ToDoWithRealm
//
//  Created by 김담인 on 2023/02/16.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        VStack {
            Text("My tasks")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            List {
                ForEach(realmManager.tasks, id: \.id) { task in
                        TaskRow(task: task.title, completed: task.completed)
                        .onTapGesture {
                        realmManager.updateTask(id: task.id, completed: !task.completed)
                    }
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                realmManager.deleteTask(id: task.id)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                }
                .listRowSeparator(.hidden)
            }
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.yellow
                UITableViewCell.appearance().backgroundColor = UIColor.green
            }
            
            Spacer()
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
