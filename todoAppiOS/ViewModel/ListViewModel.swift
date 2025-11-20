//
//  ListViewModel.swift
//  todoAppiOS
//
//  Created by kishan rana ghosh on 20/11/25.
//

import Foundation
internal import Combine
internal import SwiftUI


class ListViewModel : ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_List"
    
    init() {
        getItems()
    }
    
    // save into user defaults
    func saveItems(){
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
        }
    }
    
    // get data
    func getItems(){
        guard let data = UserDefaults.standard.data(forKey: itemsKey)
        else{
            return
        }
        
        guard let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {return}
        self.items = saveItems
    }
    
    // add item
    
    func addItem(title: String){
        let newItem = ItemModel(Title: title, IsCompleted: false)
        items.append(newItem)
    }
    // update complted bool
    func update(item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateCompleted()
        }
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItems(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
        
    
}
