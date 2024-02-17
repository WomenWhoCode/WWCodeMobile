//
//  PopupView.swift
//  TaskTracker
//
//  Created by Alexandra Harley on 2/17/24.
//

import SwiftUI

struct PopupView: View {
    let text: String
    // required
    let firstButtonText: String
    // optional
    let secondButtonText: String?
    @State var showButton: Bool
    
    init(text: String, firstButtonText: String, secondButtonText: String?, showButton: Bool) {
        self.text = text
        self.firstButtonText = firstButtonText
        self.secondButtonText = secondButtonText
        self.showButton = showButton
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Button {
                    showButton.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.black)
                }
            }
            Text(text)
                .dynamicTypeSize(.large)
                .multilineTextAlignment(.center)
                .padding()

            HStack {
                Button {
                    // TODO: Navigate back to ListView
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .foregroundStyle(.gray)
                        Text(firstButtonText)
                            .foregroundStyle(.white)
                            .dynamicTypeSize(.medium)
                            .fontWeight(.medium)
                            .padding()
                    }
                    .padding()
                    .frame(minWidth: 0, maxWidth: 165, minHeight: 0, maxHeight: 60)
                }
                if let secondButtonText {
                    Button {
                        showButton.toggle()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 4)
                                .foregroundStyle(.gray)
                            Text(secondButtonText)
                                .foregroundStyle(.white)
                                .dynamicTypeSize(.medium)
                                .fontWeight(.medium)
                                .padding()
                        }
                        .padding()
                        .frame(minWidth: 0, maxWidth: 165, minHeight: 0, maxHeight: 60)
                    }
                }
            }
        }
        .padding(20)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 5)
        .frame(minWidth: 0, maxWidth: 350, minHeight: 0, maxHeight: 350)
    }
    
}

#Preview {
    
    PopupView(text: "You have unsaved data. Are you sure you want to close without saving?",
              firstButtonText: "Ok",
              secondButtonText: "Cancel",
              showButton: true)
}
