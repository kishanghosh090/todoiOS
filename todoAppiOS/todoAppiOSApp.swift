//
//  todoAppiOSApp.swift
//  todoAppiOS
//
//  Created by kishan rana ghosh on 20/11/25.
//

internal import SwiftUI

@main
struct todoAppiOSApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                NoListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
