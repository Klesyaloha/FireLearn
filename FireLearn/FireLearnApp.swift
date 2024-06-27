//
//  FireLearnApp.swift
//  FireLearn
//
//  Created by Apprenant 160 on 03/06/2024.
//

import SwiftUI
import SwiftData

/**
 Une classe pour gérer les délégués d'application et de notification.
 */
class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject, UNUserNotificationCenterDelegate {
    
    /// Une propriété optionnelle pour l'application FireLearn.
    var App: FireLearnApp?
    
    /**
     Méthode appelée après le lancement de l'application.
     
     - Parameters:
       - application: L'instance de l'application.
       - launchOptions: Les options de lancement de l'application.
     - Returns: Un booléen indiquant si le lancement a réussi.
     
     Cette méthode configure le délégué de l'instance actuelle de `UNUserNotificationCenter`.
     */
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self // Configure le délégué des notifications
        
        return true // Indique que le lancement de l'application a réussi
    }
}


@main
struct FireLearnApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            SplashView()
        }
        .modelContainer(sharedModelContainer)
    }
}
