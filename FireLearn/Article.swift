//
//  Article.swift
//  FireLearn
//
//  Created by Apprenant 160 on 27/06/2024.
//

import Foundation

/**
 La classe Article représente un article observable avec des propriétés publiées.
 */
class Article : ObservableObject{
    /// Nom de l'article.
    @Published var name : String
    /// Indique si l'article est visible.
    @Published var isVisible : Bool
    /// Position de l'article sur un plan, initialisée à (200, 670).
    @Published var position : CGPoint = CGPoint(x: 200, y: 670)
    
    /**
     Initialise une nouvelle instance de l'Article avec un nom et une visibilité spécifié.
     
     - Parameters:
         - name: Nom de l'article.
         - isVisible: Indique si l'article est visible.
     */
    init(name: String, isVisible: Bool) {
        self.name = name
        self.isVisible = isVisible
    }
}
