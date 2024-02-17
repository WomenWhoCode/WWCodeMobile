//
//  TaskListPreviewData.swift
//  TaskTracker
//
//  Created by Itunu Raimi on 14/02/2024.
//
import SwiftUI
import SwiftData

@MainActor
let taskListPreviewContainer: ModelContainer = {
    do {
        let container = try ModelContainer (
            for: Task.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        container.mainContext.insert(Task(name: "walking 🚶", date: .now, startTime: .now.addingTimeInterval(-3610), endTime: .now))
        container.mainContext.insert(Task(name: "finishing certifications", date: .now.addingTimeInterval(-7200), startTime: .now.addingTimeInterval(-7200), endTime: .now))
        container.mainContext.insert(Task(name: "setting up new dryer unit", date: .now, startTime: .now.addingTimeInterval(-1800), endTime: .now))
        container.mainContext.insert(Task(name: "coding crunch time 😱", date: .now.addingTimeInterval(-900), startTime: .now.addingTimeInterval(-900), endTime: .now))
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()

