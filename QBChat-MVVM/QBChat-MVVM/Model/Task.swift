//
//  Message.swift
//  QBChat-MVVM
//
//  Created by Paul Kraft on 30.10.19.
//  Copyright © 2019 QuickBird Studios. All rights reserved.
//

import Foundation

struct Task: Codable, Identifiable {
    var id: String
    var taskGroupId: String
    var content: String
    var favourite: Bool
}
