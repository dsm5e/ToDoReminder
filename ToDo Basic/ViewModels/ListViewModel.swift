//
//  ListViewModel.swift
//  ToDo Basic
//
//  Created by Golyakovph on 21.04.2023.
//

import Foundation

/*
 CRUD FUNCTIONS
 
 C - create
 R - Read
 U - Update
 D - Delete
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [ListModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    
    let itemsKey = "items-key"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let decodedData = try? JSONDecoder().decode([ListModel].self, from: data)
        else { return }
        self.items = decodedData
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ListModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ListModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateListModel()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
