//
//  AppState.swift
//  UniBus
//
//  Created by Super Charge 1 on 23/11/26.
//

import SwiftUI

@Observable
final class AppState
{
    enum Phase
    {
        case unauthenticated;
        case student;
        case manager;
    }
    
    private(set) var phase: Phase = .unauthenticated;
    private(set) var user: User? = nil;
    private let store: SessionStore;
    
    private func phase(for user: User) -> Phase
    {
        switch(user.role)
        {
        case .manager:
            return .manager;
        case .student:
            return .student;
        }
    }
    
    init(store: SessionStore = SessionStore())
    {
        self.store = store;
        
        if let storedUser = self.store.user, self.store.hasCompletedOnboarding
        {
            self.user = storedUser;
            self.phase = self.phase(for: storedUser);
        }
    }
    
    /// Called after OTP / Password login succeds.
    func beginSession(for user: User) -> Void
    {
        self.user = user;
        self.store.user = user;
    }
    
    /// After completing the first time setup
    func completeOnboarding() -> Void
    {
        guard let user = self.user else { return }
        
        self.store.hasCompletedOnboarding = true;
        self.phase = self.phase(for: user);
    }
    
    func signOut() -> Void
    {
        withAnimation(.easeInOut)
        {
            self.store.clear();
            self.user = nil;
            self.phase = .unauthenticated;
        }
    }
}
