//
//  ToDo_BasicApp.swift
//  ToDo Basic
//
//  Created by Golyakovph on 20.04.2023.
//

import SwiftUI

@main
struct ToDo_BasicApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .navigationViewStyle(.stack)
            .environmentObject(listViewModel)
        }
    }
}
