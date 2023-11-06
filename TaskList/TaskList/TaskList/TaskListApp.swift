//
//  TaskListApp.swift
//  TaskList
//
//  Created by Gizem Turker on 2.10.2023.
//

import SwiftUI

@main
struct TaskListApp: App {
  var body: some Scene {
    WindowGroup {
        NavigationView {
            TaskList()
                .environmentObject(DetailStore())
        }
    }
  }
}
