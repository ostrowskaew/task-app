//
//  TaskDetailView.swift
//  QBTaskGroup-MVVM
//
//  Created by Paul Kraft on 30.10.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import SwiftUI

struct TaskDetailState {
    var taskGroup: TaskGroup
    var currentUser: String?
    var tasks: [Task]
}

enum TaskDetailInput {
    case addTask(String)
    case updateFavouriteTask(String)
    case removeTask(String)
}

struct TaskDetailView: View {

    @EnvironmentObject
    private var viewModel: AnyViewModel<TaskDetailState, TaskDetailInput>

    @EnvironmentObject
    private var keyboardObserver: KeyboardObserver

    @State
    private var newTask = ""

    var body: some View {
        VStack {
    
            List(viewModel.tasks) { task in
                if #available(iOS 15.0, *) {
                    TaskView(task: task, isFav: task.favourite)
                        .swipeActions(edge: .trailing) {
                            Button {
                                updateFavouriteTask(taskId: task.id)
                            } label: {
                                Label("Fav", systemImage: "star.fill")
                                    
                            }
                            .tint(.yellow)
                            
                        }
                        .swipeActions(edge: .leading) {
                            Button {
                                removeTask(taskId: task.id)
                            } label: {
                                Label("Del", systemImage: "trash.fill")
                            }
                            .tint(.red)
                            
                        }
                } else {
                    // Fallback on earlier versions
                }
            }
            .onTapGesture { self.endEditing(force: true) }
            

            Divider()

            HStack {
                TextField("New task", text: $newTask, onCommit: sendTask)
                Button(action: sendTask) {
                    Text("Save")
                }
            }
            .padding([.leading, .top, .trailing])
        }
        .padding(.bottom, keyboardObserver.height)
        .navigationBarTitle(Text(viewModel.taskGroup.title), displayMode: .inline)
        .animation(.easeInOut)
    }

}

// MARK: - Private Helper

extension TaskDetailView {

    private func sendTask() {
        viewModel.trigger(.addTask(newTask))
        newTask = ""
    }
    
    private func updateFavouriteTask(taskId : String) {
        viewModel.trigger(.updateFavouriteTask(taskId))
    }
    
    private func removeTask(taskId : String) {
        viewModel.trigger(.removeTask(taskId))
    }
    

    private func endEditing(force: Bool) {
        UIApplication.shared.windows
            .forEach { $0.endEditing(force) }
    }

}
