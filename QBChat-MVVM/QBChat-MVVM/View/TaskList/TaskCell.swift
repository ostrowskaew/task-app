//
//  TaskGroupCell.swift
//  QBTaskGroup-MVVM
//
//  Created by Paul Kraft on 30.10.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import SwiftUI

struct TaskCell: View {
    let taskGroup: TaskGroup
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter
    }


    var body: some View {
        VStack(alignment: .leading) {
            Text(taskGroup.title)
                .font(.headline)

            Text(dateFormatter.string(from: taskGroup.date))
                .font(.footnote)
                .foregroundColor(Color.gray)
        }
    }
}
