//
//  File.swift
//  luv3
//
//  Created by Isaac Talb on 2024/06/21.
//

import Foundation

enum Priority: String, CaseIterable, Identifiable {
    case high = "High"
    case medium = "Medium"
    case low = "Low"
    
    var id: String { self.rawValue }
}

struct ToDoItem: Identifiable {
    let id = UUID()
    var title: String
    var priority: Priority
}
