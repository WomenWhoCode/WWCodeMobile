//
//  Task.swift
//  TaskTracker
//
//  Created by Jancy on 2/12/24.
//

import Foundation
import SwiftData

@Model
class Task {
    var name: String
    var date: Date
    var startTime: Date
    var endTime: Date
    
    init(name: String = "", date: Date = .now, startTime: Date = .now, endTime: Date) {
        self.name = name
        self.date = date
        self.startTime = startTime
        self.endTime = endTime
    }
}
