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
    @State private var taskDate = Date.now
    @State private var showDeleteConfirmationPopup: Bool = false
    @State private var startTime = Date.now
    @State private var endTime = Date.now

    var body: some View {
        ZStack {
            VStack(spacing: 10) {


                TopBarView(showDeleteConfirmationPopup: $showDeleteConfirmationPopup)

                DatePicker(selection: $taskDate, displayedComponents: .date) {
                    LeftTitleText(text: "Date")
                }
                .datePickerStyle(.compact)
                .padding([.leading, .trailing])
                
                TextField("Enter your task", text: $taskText)
                    .padding()
                    .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 200, alignment: .topLeading)
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
            // overlay for the whole screen
            .overlay(
                ZStack {
                    if showDeleteConfirmationPopup {
                        Color.black.opacity(0.5)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                showDeleteConfirmationPopup = false
                            }
                    }
                }
            )

            // show popup on the whole screen
            if $showDeleteConfirmationPopup.wrappedValue {
                DeleteConfirmationPopupView(showDeleteConfirmationPopup: $showDeleteConfirmationPopup)
            }
        }
        Spacer()
    }
    
    struct TopBarView: View {
        @State private var showCancelConfirmation = false
        @Binding var showDeleteConfirmationPopup: Bool
        var body: some View {
            HStack(alignment: .lastTextBaseline, spacing: 16){
                Spacer()
                Button(action: {
                    showDeleteConfirmationPopup = true
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

    private struct DeleteConfirmationPopupView: View {
        @Environment(\.presentationMode) var presentationMode
        @Binding var showDeleteConfirmationPopup: Bool

        var body: some View {
            ZStack {
                VStack {
                    Text("Are you sure you want to delete this entry?")
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .padding()

                    HStack {
                        Button("Ok") {
                            // TODO: Delete Timed Activity #80
                            self.showDeleteConfirmationPopup = false
                            presentationMode.wrappedValue.dismiss()
                        }
                        .frame(minWidth: 0, maxWidth: 200)
                        .font(.system(size: 20))
                        .padding()
                        .background(.gray)
                        .foregroundColor(.white)
                        .cornerRadius(5)


                        .padding()

                        Button("Cancel") {
                            self.showDeleteConfirmationPopup = false
                        }
                        .frame(minWidth: 0, maxWidth: 200)
                        .font(.system(size: 18))
                        .padding()
                        .background(.gray)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .padding()
                    }
                }
                .background(Color.white)
            }
            .frame(width: 300, height: 200)
            .cornerRadius(20)
            .shadow(radius: 20)

        }
    }
}

#Preview {
    DetailsScreen()
}
