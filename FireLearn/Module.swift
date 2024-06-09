//
//  Module.swift
//  FireLearn
//
//  Created by Apprenant 167 on 05/06/2024.
//

import Foundation
import SwiftUI

struct Module: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
}


struct ModuleList {
    
    static let listOfModules = [
        Module(imageName: "swift.png", title: "Swift", description: "Track your learning journey in Swift"),
<<<<<<< HEAD
        Module(imageName: "swiftui.png", title: "SwiftUI", description: "Track your learning journey in SwiftUI"),
=======
        Module(imageName: "swiftui.png", title: "Swift", description: "Track your learning journey in SwiftUI"),
>>>>>>> Klesya
        Module(imageName: "xcode.png", title: "Xcode", description: "Track your learning journey in Xcode"),
        Module(imageName: "github.png", title: "GitHub", description: "Track your learning journey in GitHub"),
        Module(imageName: "poo.png", title: "Programmation orienté object", description: "Track your learning journey in POO"),
        Module(imageName: "vapor.png", title: "Vapor", description: "Track your learning journey in Vapor"),
        Module(imageName: "swifdata.png", title: "Swift Data", description: "Track your learning journey in Swift Data"),
        Module(imageName: "coredata.png", title: "Core Data", description: "Track your learning journey in Core Data"),
        Module(imageName: "spritekit.png", title: "Sprite Kit", description: "Track your learning journey in Sprite Kit"),
        Module(imageName: "cloudkit.png", title: "Cloud Kit", description: "Track your learning journey in Cloud Kit"),
       
        
    ]
    
}
