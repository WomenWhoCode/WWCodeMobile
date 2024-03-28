//
//  DetailsScreen.swift
//  wwcTracker
//
//  Created by Claudia Maciel on 1/19/24.
//

import SwiftUI
import SwiftData

struct DetailsScreen: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @FocusState private var isTextFieldFocused: Bool

    @Environment(\.modelContext) private var context
    @ObservedObject var viewModel = DetailsViewModel()
    @State private var taskText: String = ""
    @State private var shouldDismiss: Bool = false
    @State private var taskDate = Date.now
    @State private var showDeleteConfirmationPopup: Bool = false
    @State private var showCancelConfirmationPopup: Bool = false
    @State private var startTime = Date.now
    @State private var endTime = Date.now
    @State private var priority: Priority = .medium
    var priorities: [Priority] = [.low, .medium, .high]

    let task: Task?
    let isEditingMode: Bool?
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                
                TopBarView(showDeleteConfirmationPopup: $showDeleteConfirmationPopup,
                           showCancelConfirmationPopup: $showCancelConfirmationPopup,
                           isEditingMode: isEditingMode ?? false)
                
                DatePicker(selection: $taskDate, displayedComponents: .date) {
                    LeftTitleText(text: "Date")
                }
                .datePickerStyle(.compact)
                .padding([.leading, .trailing])
                
                TextField("Enter your task", text: $taskText)
                    .focused($isTextFieldFocused)
                    .padding()
                    .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 200, alignment: .topLeading)
                    .padding(.bottom, (viewModel.keyboardHeight/2))
                    .border(.secondary)
                
                DatePicker(selection: $startTime, displayedComponents: .hourAndMinute) {
                    LeftTitleText(text: "Start Time")
                }
                .datePickerStyle(.compact)
                .padding([.leading, .trailing])
                
                DatePicker(selection: $endTime, displayedComponents: .hourAndMinute) {
                    LeftTitleText(text: "End Time")
                }
                .datePickerStyle(.compact)
                .padding([.leading, .trailing])
                
                VStack(alignment: .leading) {
                    LeftTitleText(text: "Priority")
                    Picker("Picker", selection: $priority) {
                        ForEach(Priority.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }.padding([.leading, .trailing])

                Spacer()
                
                DoneButton(shouldDismiss: $shouldDismiss, taskText: $taskText, taskDate: $taskDate, startTime: $startTime, endTime: $endTime, priority: $priority, task: task)
                Spacer()
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 3)
                    .foregroundStyle(.black))
            .padding()
            .cornerRadius(25)
            .onChange(of: shouldDismiss) {
                if shouldDismiss {
                    if viewModel.task != nil {
                        viewModel.updateTask(
                            name: taskText,
                            date: taskDate,
                            startTime: startTime,
                            endTime: endTime,
                            priority: priority
                        )

                    }

                    dismiss()
                }
            }
            .onAppear {
                taskText = task?.name ?? ""
                taskDate = task?.date ?? Date()
                startTime = task?.startTime ?? Date.now
                endTime = task?.endTime ?? Date.now
                priority = task?.priority ?? .medium
            }
            // overlay for the whole screen
            .overlay(
                ZStack {
                    if showDeleteConfirmationPopup || showCancelConfirmationPopup {
                        Color.black.opacity(0.5)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                showDeleteConfirmationPopup = false
                                showCancelConfirmationPopup = false
                            }
                    }
                }
            )
            
            if isTextFieldFocused {
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture {
                        isTextFieldFocused = false // Dismiss the keyboard
                    }
                    .ignoresSafeArea() // Ignore safe area insets to cover the entire screen
            }
            
            // show popup on the whole screen
            if $showDeleteConfirmationPopup.wrappedValue {
                if let unwrappedTask = task {
                    PopUpView(text: "Are you sure you want to delete this entry?",
                              firstButtonText: "Ok",
                              secondButtonText: "Cancel",
                              showButton: $showDeleteConfirmationPopup,
                              shouldDismiss: $shouldDismiss,
                              okAction: { modelContext.delete(unwrappedTask) }
                    )
                }
            }
            
            if $showCancelConfirmationPopup.wrappedValue {
                PopUpView(text: "You have unsaved data. Are you sure you want to close without saving?",
                          firstButtonText: "Ok",
                          secondButtonText: "Cancel",
                          showButton: $showCancelConfirmationPopup,
                          shouldDismiss: $shouldDismiss)
            }
        }
        Spacer()
    }
    
    struct TopBarView: View {
        @Binding var showDeleteConfirmationPopup: Bool
        @Binding var showCancelConfirmationPopup: Bool
        let isEditingMode: Bool
        var body: some View {
            HStack(alignment: .lastTextBaseline, spacing: 16){
                Spacer()
                if isEditingMode {
                    Button(action: {
                        showDeleteConfirmationPopup = true
                    },
                           label: {
                        Image(systemName: "trash.circle")
                            .foregroundStyle(.black)
                    })
                }
                Button(action: {
                    showCancelConfirmationPopup = true
                },
                       label: {
                    Image(systemName: "x.circle.fill")
                        .foregroundStyle(.red)
                })
            }
            .font(.largeTitle)
            .padding()
        }
    }
    
    struct LeftTitleText: View {
        var text: String
        
        var body: some View {
            Text(text)
                .textCase(.uppercase)
                .font(.title)
                .fontWeight(.medium)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
        }
    }
    
    struct DoneButton: View {
        @Environment(\.modelContext) var modelContext
        @Binding var shouldDismiss: Bool
        @Binding var taskText: String
        @Binding var taskDate: Date
        @Binding var startTime: Date
        @Binding var endTime: Date
        @Binding var priority: Priority
        let task: Task?

        var body: some View {
            Button("Done") {
                if let currentTask = task {
                    currentTask.name = taskText
                    currentTask.date = taskDate
                    currentTask.startTime = startTime
                    currentTask.endTime = endTime
                    currentTask.priority = priority
                } else {
                    var newTask = Task(name: taskText, date: taskDate, startTime: startTime, endTime: endTime, priority: priority)
                    modelContext.insert(newTask)
                }

                shouldDismiss = true
                
            }
            .frame(minWidth: 0, maxWidth: 200)
            .font(.system(size: 18))
            .padding()
            .foregroundColor(.green)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 3)
                    .foregroundStyle(.green))
            .cornerRadius(25)
        }
    }
}

#Preview {
    DetailsScreen(task: nil, isEditingMode: false)
}
