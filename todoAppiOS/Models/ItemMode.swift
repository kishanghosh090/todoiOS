//
//  ItemMode.swift
//  todoAppiOS
//
//  Created by kishan rana ghosh on 20/11/25.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    var id: String
    var title: String
    var isCompleted: Bool
    // UUID it is a unique string
    init(Id: String = UUID().uuidString, Title: String, IsCompleted: Bool){
        self.id = Id
        self.title = Title
        self.isCompleted = IsCompleted
    }
    
    func updateCompleted() -> ItemModel {
        return ItemModel(Id: id, Title: title, IsCompleted: !isCompleted)
    }
}
