//
//  ContentView.swift
//  MVVM_Example
//
//  Created by Renato Oliveira Fraga on 11/21/22.
//

import SwiftUI



struct ListView: View {
    
    @ObservedObject var listManager: ListManager

    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(listManager.items) { item in
                       NavigationLink(destination: {
                           HStack(spacing: 40) {
                               Text(item.name)
                                   .font(.title)
                               Spacer()
                               Text(String(item.age))
                                   .font(.headline)
                                   .foregroundColor(.red)
                           }.padding()
                       }, label: {Text(item.name)})
                    }
                    .onDelete(perform: { indexSet in
                        listManager.delete(at: indexSet)
                        
                    })
                    .onMove(perform: { indices, newOffset in
                        listManager.move(indices: indices, newOffset: newOffset)
                    })
                    
                }
                .navigationBarTitle(Text("List Example"), displayMode: .large )
                .toolbar(content: {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        EditButton()
                        Button(action: {
                            listManager.addItem()
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
        Group {
            ListView(listManager: ListManager())
            ListView(listManager: ListManager())
        }
    }
}
