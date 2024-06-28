//
//  Food.swift
//  FireLearn
//
//  Created by Klesya Loha on 27/06/2024.
//

import Foundation

/**
 La classe Food hérite de la classe Article et représente un aliment avec une quantité et une progression.
 Vérifier la collision de l'aliment avec la position de la bouche du dragon en utilisant la méthode checkCollision().
 */
class Food : Article {
    /// La quantité de l'aliment.
    @Published var quantity : Int
    /// La progression du level.
    @Published var progress : CGFloat
    
    
    /**
     Initialise une instance de Food avec des valeurs spécifiques.
     
     - Parameters :
         - name: Nom de l'article.
         - quantity: La quantité de l'aliment.
         - isVisible: Indique si l'article est visible.
         - progress: La progression du level.
     */
    init(name: String, quantity: Int, isVisible: Bool, progress: CGFloat) {
        self.progress = progress
        self.quantity = quantity
        super.init(name: name, isVisible: isVisible)
    }
    
    /**
     Fonction pour vérifier la collision de l'aliment avec la position de la bouche du dragon.
     -> Si l'aliment est à une distance de 70 points ou moins de la bouche, la fonction met à jour la variable progress et réduit quantity.
     
     - Returns : Rien
     */
    func checkCollision() {
        let mouthPosition : CGPoint = CGPoint(x: 215, y: 390)
        let dx = mouthPosition.x - position.x
        let dy = mouthPosition.y - position.y
        
        if abs(dx) <= 70 && abs(dy) <= 70 {
            if progress < 100 {
                let increment : CGFloat = min(4, 100 - progress)
                progress += increment
                quantity -= 1
                isVisible = false
            }
        }
    }
}
