//
//  AddTask.swift
//  TaskList
//
//  Created by Gizem Turker on 2.10.2023.
//

import SwiftUI

struct AddTask: View {
  static let defaultTaskTitle = "An untitled masterpiece"

  let taskStore: TaskStore
  @Binding var isPresented: Bool
  @State private var title = ""
  @State private var notes = ""
  @State private var isCompleted: Bool = false
  
    var updateTaskList: () -> Void

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Title")) {
          TextField("Title", text: $title)
        }
        Section(header: Text("NOTES")) {
            TextField("Title", text: $notes)
        }
    
      }
      .navigationBarTitle(Text("Add Task"), displayMode: .inline)
      .navigationBarItems(
        leading:
            Button(action: {
               
                isPresented.toggle()
            }) {
                Text("Cancel")
                    .font(.title3)
                    .foregroundColor(.blue)
            },
        trailing:
            Button(action: {
                addTask()
                isPresented.toggle()
        
                updateTaskList()
            }) {
                Text("Add")
                    .font(.title3)
                    .foregroundColor(.blue)
            }
        
      )
    }
  }

    private func addTask() {
    taskStore.addTask(
      title: title.isEmpty ? AddTask.defaultTaskTitle : title,
      notes: notes,
      isCompleted: isCompleted)

    isPresented.toggle()
  }
}

