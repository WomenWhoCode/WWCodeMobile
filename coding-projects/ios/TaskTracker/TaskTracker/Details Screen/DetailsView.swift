//
//  DetailsScreen.swift
//  wwcTracker
//
//  Created by Claudia Maciel on 1/19/24.
//

import SwiftUI

struct DetailsScreen: View {
    @ObservedObject var viewModel = DetailsViewModel()
    @State private var taskText: String = ""
    
    var body: some View {
        VStack(spacing: 5) {
            
            TopBarView()
            
            ButtonSelectorView(descriptionText: "Date", buttonString: "Date") {
                // TODO: Add date picker #129
            }
            
            TextField("Enter your task", text: $taskText)
                .padding()
                .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 200, alignment: .topLeading)
                .border(.secondary)
            
            ButtonSelectorView(descriptionText: "Start Time", buttonString: "TIME") {
                // Start time button method call
                // TODO: Add time pickers #130
            }
            
            ButtonSelectorView(descriptionText: "End Time", buttonString: "TIME") {
                // End time button method call
                // TODO: Add time pickers #130
            }
            
            Spacer()
            
            DoneButton()
            
            Spacer()
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(lineWidth: 3)
                .foregroundStyle(.black))
        .padding()
        .cornerRadius(25)
        
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
                Text(descriptionText)
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
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
        var body: some View {
            Button("Done") {
                // TODO: Done Button redirect #133
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
