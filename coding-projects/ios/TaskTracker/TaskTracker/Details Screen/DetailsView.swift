//
//  DetailsScreen.swift
//  wwcTracker
//
//  Created by Claudia Maciel on 1/19/24.
//

import SwiftUI

struct DetailsScreen: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = DetailsViewModel()
    @State private var taskText: String = ""
    @State private var shouldDismiss: Bool = false

    @State private var startTime = Date.now
    @State private var endTime = Date.now

    var body: some View {
        VStack(spacing: 10) {

            TopBarView()
            
            ButtonSelectorView(descriptionText: "Date", buttonString: "Date") {
                // TODO: Add date picker #129
            }
            
            TextField("Enter your task", text: $taskText)
                .padding()
                .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 200, alignment: .topLeading)
                .border(.secondary)

            DatePicker(selection: $startTime, displayedComponents: .hourAndMinute) {
                TextView(text: "Start Time")
            }
            .datePickerStyle(.compact)
            .padding([.leading, .trailing])

            DatePicker(selection: $endTime, displayedComponents: .hourAndMinute) {
                TextView(text: "End Time")
            }
            .datePickerStyle(.compact)
            .padding([.leading, .trailing])
            
            Spacer()
            
            DoneButton(shouldDismiss: $shouldDismiss)

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
                dismiss()
            }
        }
        Spacer()
    }
    
    struct TopBarView: View {
        @State private var showCancelConfirmation = false
        
        var body: some View {
            HStack(alignment: .lastTextBaseline, spacing: 16){
                Spacer()
                Button(action: {
                    // TODO: Add confirmation pop-up for delete button #132
                },
                       label: {
                    Image(systemName: "trash.circle")
                        .foregroundStyle(.black)
                })
                Button(action: {
                    // TODO: Add confirmation pop-up for cancel button #132
                    showCancelConfirmation.toggle()
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

    struct TextView: View {
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

    struct ButtonSelectorView: View {
        var descriptionText: String
        @State var buttonString: String
        var buttonAction: () -> Void
        
        init(descriptionText: String, buttonString: String, buttonAction: @escaping () -> Void) {
            self.descriptionText = descriptionText
            self.buttonString = buttonString
            self.buttonAction = buttonAction
        }
        
        var body: some View {
            HStack {
                TextView(text: descriptionText)
                Spacer()
                Button {
                    buttonAction()
                } label: {
                    Text(buttonString)
                        .foregroundStyle(.white)
                        .fontWeight(.medium)
                }
                .padding()
                .frame(minWidth: 0, maxWidth: 120)
                .border(Color.green, width: 3)
                .background(.green)
                .minimumScaleFactor(0.5)
                
            }
            .padding()
        }
    }
    
    struct DoneButton: View {
        @Binding var shouldDismiss: Bool

        var body: some View {
            Button("Done") {
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
    DetailsScreen()
}
