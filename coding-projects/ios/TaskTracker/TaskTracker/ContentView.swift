//
//  ContentView.swift
//  TaskTracker
//
//  Created by Claudia Maciel on 1/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Spacer()
            HeaderView()
            ListView(viewModel: ListViewModel())
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        ScreenTitleView()
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        AddButtonView()
                    }
                }
        }
    }
}

private struct HeaderView: View {
    var body: some View {
        Text("Your Activity")
            .font(.headline)
            .padding(.leading, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct ScreenTitleView: View {
    var body: some View {
        Text("Timer")
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}

private struct AddButtonView: View {
    @State private var showDetailsScreen = false
    var body: some View {
        Button(action: {
            showDetailsScreen.toggle()
        }, label: {
            Image(systemName: "plus.circle.fill")
                .foregroundColor(Color.green)
                .font(Font.body.weight(.black))
        })
        .sheet(isPresented: $showDetailsScreen, content: {
            DetailsScreen()
        })
    }
}

#Preview {
    ContentView()
        .modelContainer(taskListPreviewContainer)
}
