//
//  Item.swift
//  FireLearn
//
//  Created by Apprenant 122 on 05/06/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
