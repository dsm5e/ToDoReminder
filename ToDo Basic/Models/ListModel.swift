//
//  ListModel.swift
//  ToDo Basic
//
//  Created by Golyakovph on 20.04.2023.
//

import Foundation

struct ListModel: Identifiable, Codable {
    var id: String
    var title: String
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateListModel() -> ListModel {
        return ListModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
