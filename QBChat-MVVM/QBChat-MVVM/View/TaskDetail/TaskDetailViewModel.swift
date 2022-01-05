//
//  TaskDetailViewModel.swift
//  QBTaskGroup-MVVM
//
//  Created by Paul Kraft on 30.10.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import Foundation

class TaskDetailViewModel: ViewModel {

    @Published
    private(set) var state: TaskDetailState

    private let taskService: TaskService

    private let taskGroup: TaskGroup

    init(taskGroup: TaskGroup, taskService: TaskService) {
        self.taskService = taskService
        self.taskGroup = taskGroup
        self.state = TaskDetailState(taskGroup: taskGroup,
                                     tasks: [])
        self.state.tasks = fetchTasks()
    }

    func fetchTasks() -> [Task] {
        taskService.fetchTasks()
            .filter { $0.taskGroupId == taskGroup.id }
    }

    func trigger(_ input: TaskDetailInput) {
        switch input {
        case .addTask(let task):
            taskService.addTask(task, to: taskGroup)
            self.state.tasks = fetchTasks()
        case .updateFavouriteTask(let taskId):
            taskService.updateFavouriteTask(taskId, of: taskGroup)
            self.state.tasks = fetchTasks()
        case .removeTask(let taskId):
            taskService.removeTask(taskId, of: taskGroup)
            self.state.tasks = fetchTasks()
       
        }
    }

}
