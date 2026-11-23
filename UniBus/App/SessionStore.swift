//
//  SessionStore.swift
//  UniBus
//
//  Created by Super Charge 1 on 23/11/26.
//

import Foundation

final class SessionStore
{
    private let defaults = UserDefaults.standard;
    private enum Key
    {
        static let user = "current_user";
        static let onboarded = "has_completed_onboarding";
    }
    
    var user: User?
    {
        get
        {
            guard let data = self.defaults.data(forKey: Key.user) else { return nil }
            return try? JSONDecoder().decode(User.self, from: data);
        }
        set
        {
            self.defaults.set(try? JSONEncoder().encode(newValue), forKey: Key.user);
        }
    }
    
    var hasCompletedOnboarding: Bool
    {
        get
        {
            self.defaults.bool(forKey: Key.onboarded);
        }
        set
        {
            self.defaults.set(newValue, forKey: Key.onboarded);
        }
    }
    
    func clear() -> Void
    {
        self.defaults.removeObject(forKey: Key.user);
        self.defaults.removeObject(forKey: Key.onboarded);
    }
}
