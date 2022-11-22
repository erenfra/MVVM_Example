//
//  MVVM_ExampleApp.swift
//  MVVM_Example
//
//  Created by Renato Oliveira Fraga on 11/21/22.
//

import SwiftUI

@main
struct MVVM_ExampleApp: App {
    @StateObject var listManager = ListManager()
    var body: some Scene {
        WindowGroup {
            ListView(listManager: listManager)
        }
    }
}
