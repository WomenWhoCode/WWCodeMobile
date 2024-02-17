//
//  TaskTrackerApp.swift
//  TaskTracker
//
//  Created by Claudia Maciel on 1/23/24.
//
import SwiftData
import SwiftUI

@main
struct TaskTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
