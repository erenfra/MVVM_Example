//
//  ListManager.swift
//  MVVM_Example
//
//  Created by Renato Oliveira Fraga on 11/21/22.
//

import Foundation

class ListManager: ObservableObject {
    
    @Published var items: [Item] = [Item(id: UUID(), name: "Renato", age: 47),
                                    Item(id: UUID(), name: "Tracey", age: 44),
                                    Item(id: UUID(), name: "Emilia", age: 4)]
    
    init() {
        //get my data set to my items array
    }
    
    func delete(at indexSet: IndexSet) {
        for index in indexSet {
            items.remove(at: index)
        }
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        items.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func addItem() {
        items.append(Item(id: UUID(), name: "New Name", age: 30))
    }
}
