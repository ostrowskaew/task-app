//
//  MockChatService.swift
//  QBChat-MVVM
//
//  Created by Paul Kraft on 30.10.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import Foundation

class MockTaskService: TaskService {

    private var taskGroups = [
        TaskGroup(id: "1", title: "House Chores", date: Date()),
        TaskGroup(id: "2", title: "University", date: Date()),
        TaskGroup(id: "3", title: "Party sunday", date: Date()),
        TaskGroup(id: "4", title: "Mom birthday", date: Date())
    ]

    private var tasks = [
        Task(id: UUID().uuidString, taskGroupId: "1",  content: "Wash dishes", favourite: false),
        Task(id: UUID().uuidString, taskGroupId: "1",  content: "Do loundry", favourite: false),
        Task(id: UUID().uuidString, taskGroupId: "1",  content: "Throw out trash", favourite: false),
        Task(id: UUID().uuidString, taskGroupId: "2",  content: "Send email to ms. Brown", favourite: false),
        Task(id: UUID().uuidString, taskGroupId: "2",  content: "Write paper on condensators", favourite: false),
        Task(id: UUID().uuidString, taskGroupId: "3",  content: "Buy drinks", favourite: false),
        Task(id: UUID().uuidString, taskGroupId: "4",  content: "Buy present", favourite: false)
    ]

    func fetchTaskGroups() -> [TaskGroup] {
        taskGroups
    }

    func fetchTasks() -> [Task] {
        tasks
    }

    func addTask(_ content: String, to taskGroup: TaskGroup) -> Task {
        let task = Task(id: UUID().uuidString,
                              taskGroupId: taskGroup.id,
                              content: content,
                              favourite: false)
        tasks.append(task)
        return task
    }
    
    func saveTaskGroup(_ content: String) -> TaskGroup {
        let taskGroup = TaskGroup(id: UUID().uuidString,
                        title: content,
                        date: Date())
        taskGroups.append(taskGroup)
        return taskGroup
    }
    
    func updateFavouriteTask(_ task: String, of taskGroup: TaskGroup) {
        if let i = tasks.firstIndex(where: { $0.id == task }) {
            if(tasks[i].favourite == false) {
                tasks[i].favourite = true
            }else {
                tasks[i].favourite = true
            }
        }
    }
    
    func removeTask(_ task: String, of taskGroup: TaskGroup) {
        if let i = tasks.firstIndex(where: { $0.id == task }) {
            tasks.remove(at: i)
        }
    }


}
