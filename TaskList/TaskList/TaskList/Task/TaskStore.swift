//
//  TaskStore.swift
//  TaskList
//
//  Created by Gizem Turker on 2.10.2023.
//

import Foundation

class TaskStore: ObservableObject {
    static let taskKey = "Tasks"
    static let defaultTasks = [
        Task(title: "Task 1", notes: "", isCompleted: true),
        Task(title: "Task 2", notes: "", isCompleted: true),
        Task(title: "Task 3", notes: "", isCompleted: false),
        Task(title: "Task 4", notes: "", isCompleted: false),
        Task(title: "Task 5", notes: "", isCompleted: true)
        
    ]
    
    static func loadTasks() -> [Task] {
        let savedTasks = UserDefaults.standard.object(forKey: TaskStore.taskKey)
        if let savedTasks = savedTasks as? Data {
            let decoder = JSONDecoder()
            return (try? decoder.decode([Task].self, from: savedTasks)) ?? TaskStore.defaultTasks
        }
        return TaskStore.defaultTasks
    }
    
    @Published var tasks = loadTasks() {
        didSet {
            persistTasks()
        }
    }
    
    func addTask(title: String, notes:String, isCompleted: Bool) {
        let newTask = Task(title: title, notes: notes, isCompleted: isCompleted)
        tasks.append(newTask)
    }
    
    func deleteTask(at offsets: IndexSet){
        tasks.remove(atOffsets: offsets)
    }
    
    private func persistTasks() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: TaskStore.taskKey)
        }
    }
}
