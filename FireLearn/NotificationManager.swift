//
//  NotificationManager.swift
//  FireLearn
//
//  Created by Apprenant 122 on 20/05/2024.
//

import Foundation
import UserNotifications

/**
 Une classe pour gérer les autorisations de notification en utilisant le framework UserNotifications.
 */
@MainActor // Assure que toutes les méthodes et propriétés de cette classe sont exécutées sur le thread principal
class NotificationManager: ObservableObject {
    
    /// Une propriété publiée pour observer les changements de statut de l'autorisation de notification.
    @Published private(set) var hasPermission = false
    
    /**
     Initialisateur qui demande l'autorisation de notification lors de la création de l'instance.
     */
    init() {
        Task {
            await request() // Appelle la méthode request de manière asynchrone
        }
    }
    
    /**
     Méthode pour demander l'autorisation de notification de manière asynchrone.
     
     Cette méthode demande l'autorisation pour les alertes, les badges et les sons.
     Elle met à jour la propriété ``hasPermission`` en fonction du statut de l'autorisation.
     */
    func request() async {
        do {
            // Demande l'autorisation pour les alertes, les badges et les sons
            try await UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound])
        } catch {
            // Affiche toute erreur rencontrée lors de la demande
            print(error)
        }
        
        // Récupère les paramètres de notification actuels
        let status = await UNUserNotificationCenter.current().notificationSettings()
        // Met à jour la propriété ``hasPermission`` en fonction du statut de l'autorisation
        switch status.authorizationStatus {
        case .authorized, // L'utilisateur a accordé l'autorisation
             .provisional, // L'utilisateur a accordé une autorisation provisoire
             .ephemeral: // L'utilisateur a accordé une autorisation temporaire
            hasPermission = true
        default: // Tout autre statut (refusé, non déterminé, etc.)
            hasPermission = false
        }
    }
}
