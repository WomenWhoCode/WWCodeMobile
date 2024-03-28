//
//  SettingsView.swift
//  TaskTracker
//
//  Created by Claudia Maciel on 1/27/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Form {
                Section {
                    AboutUsView()
                    PrivacyView()
                    TutorialView()
                    RateAppView()
                    FollowOnTwitterView()
                } header: {
                    Label("Info & Feedback", systemImage: "info.bubble.fill")
                        .font(.subheadline)
                        .fontWeight(.bold)
                } footer: {
                    VersionView()
                }
                
                Section {
                    DaysView()
                    ShowBadgeView()
                    ReminderNotificationView()
                    ReminderTimeView()
                } header: {
                    Label("Notifications", systemImage:
                            "bell.fill")
                    .font(.subheadline)
                    .fontWeight(.bold)
                }
                
                Section {
                    VersionViewRow()
                    VoteViewRow()
                } header: {
                    Label("What's New", systemImage: "wand.and.stars")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }

                Section {
                    ThemeView()
                    AppIconView()
                } header: {
                    Label("Appearance",
                          systemImage: "paintpalette")
                    .font(.subheadline)
                    .fontWeight(.bold)
                }
            }
            .navigationBarTitle("Settings")
        }
    }
    
    private struct AboutUsView: View {
        
        var body: some View {
            HStack{
                Image(systemName: "info.circle.fill")
                    .foregroundColor(.purple)
                    .font(Font.body.weight(.regular))
                    .imageScale(.large)
                Text("About Us")
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
    }
    
    private struct PrivacyView: View {
        
        var body: some View {
            HStack{
                Image(systemName: "lock.shield.fill")
                    .foregroundColor(.purple)
                    .font(Font.body.weight(.regular))
                    .imageScale(.large)
                Text("Privacy Policy")
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
    }
    
    private struct DaysView: View {
        let title: String = "Show Days"
        let days = Calendar.current.shortWeekdaySymbols
        
        var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                Text(title)
                HStack {
                    ForEach(days, id: \.self) { day in
                        ZStack {
                            Circle()
                                .opacity(0.5)
                            Text(day.prefix(1))
                                .font(.subheadline)
                                .foregroundStyle(.white)
                                .frame(width: 20, height: 20, alignment: .center)
                        }
                    }
                }
            }
        }
    }
    
    private struct VersionViewRow: View {
        var body: some View {
            HStack{
                VersionView()
            }
        }
    }
    
    private struct VersionView: View {
        let appVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        var body: some View {
            HStack{
                Image(systemName: "iphone.gen2.circle")
                    .foregroundColor(.purple)
                    .font(Font.body.weight(.regular))
                    .imageScale(.large)
                Text("Version " + appVersion)
            }
        }
    }
    
    private struct VoteViewRow: View {
        
        var body: some View {
            HStack {
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(.purple)
                    .font(Font.body.weight(.regular))
                    .imageScale(.large)
                Text("Vote on future requests")
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
    }
    
    private struct RateAppView: View {
        
        var body: some View {
            HStack{
                Image(systemName: "star.fill")
                    .foregroundColor(.purple)
                    .font(Font.body.weight(.regular))
                    .imageScale(.large)
                Text("Rate app")
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
    }
    
    private struct FollowOnTwitterView: View {
        
        var body: some View {
            HStack {
                // Image Credit: Freepik @ Flaticon https://www.flaticon.com/free-icon/twitter_5968958
                Image("twitter")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.purple)
                    .scaledToFit()
                    .frame(width: 20)
                    .padding(.horizontal, 3.5)
                Text("Follow Us on Twitter")
                Spacer()
                
                Link(destination:
                        URL(string: "https://twitter.com/WomenWhoCode")!)
                {
                    Image(systemName: "arrow.up.right.square")
                        .padding(.horizontal, -5)
                        .font(.system(size: 20))
                }
                .foregroundColor(.black)
            }
        }
    }
    
    
    private struct ThemeView: View {
        var body: some View {
            HStack {
                Image(systemName: "paintbrush")
                    .foregroundColor(.purple)
                    .font(Font.body.weight(.regular))
                    .imageScale(.large)
                Text("App Theme")
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
    }
    
    private struct AppIconView: View {
        var body: some View {
            HStack {
                Image(systemName: "square.fill")
                    .foregroundColor(.purple)
                    .font(Font.body.weight(.regular))
                    .imageScale(.large)
                Text("App Icon")
                Spacer()
                Text("PRO")
                    .foregroundColor(.purple)
                    .font(Font.body.weight(.light))
                Image(systemName: "chevron.right")
            }
        }
    }
    
    private struct ShowBadgeView: View {
        @State private var showBadge = true
        var body: some View {
            HStack {
                Text("Show Badge")
                Spacer()
                Toggle(isOn: $showBadge) {}
                    .tint(.purple)
            }
        }
    }
    
    private struct ReminderTimeView: View {
        var body: some View {
            HStack{
                Text("Reminder Time")
                Spacer()
                Text("7:00 PM")
            }
        }
    }
    
    private struct ReminderNotificationView: View {
        @State private var canNotify = false
        
        var body: some View {
            HStack{
                Text("Send notification")
                Spacer()
                Toggle(isOn: $canNotify) {}
                    .tint(.purple)
            }
        }
    }
    
    private struct TutorialView: View {
        
        var body: some View {
            HStack{
                Image(systemName: "questionmark.video.fill")
                    .foregroundColor(.purple)
                    .font(Font.body.weight(.regular))
                    .imageScale(.large)
                Text("Tutorial")
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
    }
}

#Preview {
    SettingsView()
}

