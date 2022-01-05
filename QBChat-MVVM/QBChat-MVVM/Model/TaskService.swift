//
//  TaskGroupService.swift
//  QBTaskGroup-MVVM
//
//  Created by Paul Kraft on 30.10.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import Foundation

protocol TaskService {
    func fetchTaskGroups() -> [TaskGroup]
    func fetchTasks() -> [Task]

    @discardableResult
    func addTask(_ content: String, to chat: TaskGroup) -> Task
    
    @discardableResult
    func saveTaskGroup(_ content: String) -> TaskGroup
    
    func updateFavouriteTask(_ task: String, of chat: TaskGroup) -> Void
    
    func removeTask(_ task: String, of chat: TaskGroup) -> Void
}
