//
//  ListView.swift
//  wwcTracker
//
//  Created by Claudia Maciel on 1/19/24.
//

import SwiftUI
import SwiftData

struct ListView: View {
    @ObservedObject var viewModel: ListViewModel
    @Query var tasks: [Task]

    var body: some View {
        List(tasks) { task in
            // TODO: Display list items in sections based on date #126
            let duration = viewModel.formatDuration(start: task.startTime, end: task.endTime)
            ActivityItemView(name: task.name, duration: duration)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

struct ActivityItemView: View {
    let name: String
    let duration: String

    var body: some View {
        HStack {
            Text(name)
            Spacer()
            Text(duration)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray, lineWidth: 2)
        )
    }
}

#Preview {
    ListView(viewModel: ListViewModel())
        .modelContainer(taskListPreviewContainer)
}
