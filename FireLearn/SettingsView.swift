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
            Text("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
