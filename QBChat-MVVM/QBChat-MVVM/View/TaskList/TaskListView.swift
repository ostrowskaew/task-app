//
//  TaskListView.swift
//  QBTaskGroup-MVVM
//
//  Created by Paul Kraft on 30.10.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import SwiftUI

struct TaskListState {
    var taskGroups: [AnyViewModel<TaskDetailState, TaskDetailInput>]
}

extension TaskDetailState: Identifiable {
    var id: TaskGroup.ID {
        taskGroup.id
    }
}

enum TaskListInput {
    case saveTaskGroup(String)
}

struct TaskListView: View {
    
    @EnvironmentObject
    private var keyboardObserver: KeyboardObserver
    
    @State
    private var newTaskGroup = ""

    @EnvironmentObject
    var viewModel: AnyViewModel<TaskListState, TaskListInput>

    var body: some View {
        VStack {
         
            NavigationView {
                List(viewModel.taskGroups) { viewModel in
                    NavigationLink(destination: TaskDetailView().environmentObject(viewModel)) {
                        TaskCell(taskGroup: viewModel.state.taskGroup)
                    }
                }
                .navigationBarTitle("TaskGroups")
                .navigationBarItems(leading:
                    TextField("Create new group of tasks", text: $newTaskGroup, onCommit: saveTaskGroup )
                    )
                .navigationBarItems(trailing:
                        Button(action: saveTaskGroup) {
                            Text("Add")
                        }
                    )
            
            }
            

        }
        .padding(.bottom, keyboardObserver.height)
        .animation(.easeInOut)        
    }

}

// MARK: - Private Helper

extension TaskListView {

    private func saveTaskGroup() {
        viewModel.trigger(.saveTaskGroup(newTaskGroup))
        newTaskGroup = ""
    }


}

