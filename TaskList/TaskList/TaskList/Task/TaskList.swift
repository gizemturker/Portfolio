//
//  TaskList.swift
//  TaskList
//
//  Created by Gizem Turker on 2.10.2023.
//

import SwiftUI

struct TaskList: View {
    @State private var isAddTaskSheetPresented = false
    @EnvironmentObject var detailStore: DetailStore
    @StateObject var taskStore = TaskStore()
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(taskStore.tasks, id: \.title) { task in
                    TaskRow(task: task)
                        .onTapGesture {
                            let detailInfo = DetailInfo(detailTitle: task.title, notes: task.notes, isCompleted: task.isCompleted)
                            detailStore.currentDetailInfo = detailInfo
                            withAnimation{
                                isPresented.toggle()
                            }
                        }
                }
                .onDelete(perform: taskStore.deleteTask)
            }
            
            .sheet(isPresented: $isPresented) {
                AddTask(taskStore: taskStore, isPresented: $isPresented, updateTaskList: {
                    
                    TaskStore.loadTasks()
                         })
            }
            
            .sheet(isPresented: $isPresented) {
                DetailView().environmentObject(detailStore)
            }
            
            

            .navigationBarTitle(Text("My Tasks"))
            
 
        }
        
        .overlay(
            HStack {
                Button(action: { isPresented.toggle() }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.blue)
                }
                Text("New Task")
                    .foregroundColor(.blue)
                    .font(.headline)
                    .padding(.leading, 8)
            }

                .padding()
            , alignment: .bottomLeading
        )
    }
}

struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskList()
            .environmentObject(TaskStore())
            .environmentObject(DetailStore())
    }
}

