//
//  CourseModel.swift
//  FireLearn
//
//  Created by Apprenant 167 on 07/06/2024.
//

import Foundation

struct CourseModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
