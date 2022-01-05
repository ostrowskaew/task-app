//
//  TaskView.swift
//  QBChat-MVVM
//
//  Created by Paul Kraft on 30.10.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import SwiftUI

struct TaskView: View {
    let task: Task
    let isFav: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            
            Text(task.content)
                .lineLimit(nil)
                .padding(8)
                .font(.body)
                .background(textBackgroundColor)
                .cornerRadius(8)
        }
    }

    private var textBackgroundColor: Color {
        if (isFav) {return .yellow }else { return .white }
        
    }
}
