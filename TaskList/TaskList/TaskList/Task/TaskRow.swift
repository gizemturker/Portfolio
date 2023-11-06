//
//  TaskRow.swift
//  TaskList
//
//  Created by Gizem Turker on 2.10.2023.
//

import SwiftUI

struct TaskRow: View {
  let task: Task
 

  var body: some View {
    HStack(alignment: .firstTextBaseline) {
      VStack(alignment: .leading) {
          TaskText(text: task.title)
        
      }

      Spacer()

      VStack(alignment: .trailing) {
          CheckmarkView(isCompleted: task.isCompleted)
      }
    }
    .padding(.vertical)
  }
}

struct TaskRow_Previews: PreviewProvider {
  static var previews: some View {
      TaskRow(task: TaskStore().tasks[0])
      .previewLayout(.sizeThatFits)
      .environmentObject(DetailStore())
  }
}
