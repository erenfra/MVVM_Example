//
//  ContentView.swift
//  MVVM_Example
//
//  Created by Renato Oliveira Fraga on 11/21/22.
//

import SwiftUI

struct Item: Identifiable {
    var id: UUID
    var name: String
    var age: Int
}

struct ContentView: View {
    
    @State var items = [Item(id: UUID(), name: "Renato", age: 47),
                 Item(id: UUID(), name: "Tracey", age: 44),
                 Item(id: UUID(), name: "Emilia", age: 4)]
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(items) { item in
                        HStack(spacing: 40) {
                            Text(item.name)
                                .font(.title)
                            Spacer()
                            Text(String(item.age))
                                .font(.headline)
                                .foregroundColor(.red)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        for index in indexSet {
                            items.remove(at: index)
                        }
                    })
                    .onMove(perform: { indices, newOffset in
                        items.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    
                }
                .navigationBarTitle(Text("List Example"), displayMode: .large )
                .toolbar(content: {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        EditButton()
                        Button(action: {
                            items.append(Item(id: UUID(), name: "New Name", age: 30))
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                })
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
