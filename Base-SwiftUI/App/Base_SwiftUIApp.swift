//
//  Base_SwiftUIApp.swift
//  Base-SwiftUI
//
//  Created by ECO1152-HOANGND on 03/08/2023.
//

import SwiftUI

@main
struct Base_SwiftUIApp: App {
    
    @StateObject var rootConfig: RootConfig = RootConfig()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .onAppear(perform: {
                    rootConfig.initialRootType()
                })
                .environmentObject(rootConfig)
        }
    }
}
