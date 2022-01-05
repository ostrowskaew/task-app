//
//  TaskListViewModel.swift
//  QBTaskGroup-MVVM
//
//  Created by Paul Kraft on 30.10.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import Foundation

class TaskListViewModel: ViewModel {

    @Published
    var state: TaskListState
    
    private let taskService: TaskService
    
    var viewModels: [AnyViewModel<TaskDetailState, TaskDetailInput>]
    
    init(taskService: TaskService) {
        self.taskService = taskService
        viewModels = taskService.fetchTaskGroups().map {
            AnyViewModel(TaskDetailViewModel(taskGroup: $0, taskService: taskService))
        }
        self.state = TaskListState(taskGroups: viewModels)
        
    }

    func trigger(_ input: TaskListInput) {
        switch input {
        case .saveTaskGroup(let task):
            taskService.saveTaskGroup(task)
            viewModels = taskService.fetchTaskGroups().map {
                AnyViewModel(TaskDetailViewModel(taskGroup: $0, taskService: taskService))
            }
            self.state = TaskListState(taskGroups: viewModels)
        }
    }
    


}
