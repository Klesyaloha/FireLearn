//
//  Item.swift
//  FireLearn
//
//  Created by Apprenant 160 on 03/06/2024.
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
