//
//  User.swift
//  navigation
//
//  Created by Super Charge 1 on 23/11/26.
//

import Foundation

enum UserRole
{
    case student;
    case manager;
}

enum Profile
{
    case student(Student);
    case manager(Manager);
}

struct User: Identifiable
{
    let id: UUID;
    let university: UUID; // University id
    
    var name: String;
    var email: String;
    var role: UserRole;
    var profile: Profile;
}

struct Student
{
    var homeStopID: UUID?;
    
    /// Daily timings
    /// Index 0: Mon:- [morning, evening]
    /// Index 1: Tue:- [morning, evening] and so on...
    var timings: [[Time?]];
}

struct Manager
{
    var isAdmin: Bool;
}
