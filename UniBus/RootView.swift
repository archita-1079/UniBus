//
//  RootView.swift
//  UniBus
//
//  Created by Super Charge 1 on 23/11/26.
//

import SwiftUI

struct RootView: View
{
    @Environment(AppState.self) private var appState;
    
    var body: some View
    {
        VStack
        {
            Group
            {
                switch(self.appState.phase)
                {
                case .unauthenticated:
                    StartScreen();
                case .student:
                    StudentHome();
                case .manager:
                    ManagerHome();
                }
            }
            .transition(.opacity);
        }
    }
}

#Preview
{
    RootView()
        .environment(AppState());
}
