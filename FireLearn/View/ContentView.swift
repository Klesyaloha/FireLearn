//
//  ContentView.swift
//  FireLearn
//
//  Created by Apprenant 160 on 03/06/2024.
//

import SwiftUI
import SwiftData
import UserNotifications

struct ContentView: View {
    @StateObject private var manager = NotificationManager()
    
    var body: some View {
        switch manager.hasPermission {
        case true:
            MyView()
        case false:
            Text("Noti not active").onAppear {
                Task {
                    await manager.requestPermission()
                }
            }
        }
    }
}

struct MyView: View {
    var body: some View {
        Text("Noti active")
    }
}

#Preview {
    MyView()
}
