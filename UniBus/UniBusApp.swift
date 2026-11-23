//
//  UniBusApp.swift
//  UniBus
//
//  Created by Super Charge 1 on 23/11/26.
//

import SwiftUI

@main
struct UniBusApp: App {
    @State
    private var appState = AppState();
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(appState);
        }
    }
}
