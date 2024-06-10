//
//  SettingsView.swift
//  FireLearn
//
//  Created by Kamil on 09/06/2024.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var manager = NotificationManager()
    
    var body: some View {
        ZStack {
            Image("startFond").resizable().ignoresSafeArea()
            Button("Notification enabler") {
                Task {
                    await manager.request()
                    await manager.getAuthStatus()
                }
            }
            .buttonStyle(BlackButtonStyle(isEnabled: !manager.hasPermission))
            .disabled(manager.hasPermission)
            .task {
                await manager.getAuthStatus()
            }
        }
    }
}

struct BlackButtonStyle: ButtonStyle {
    var isEnabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(isEnabled ? Color.black : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

#Preview {
    SettingsView()
}
