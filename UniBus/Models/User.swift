//
//  User.swift
//  UniBus
//
//  Created by Super Charge 1 on 23/11/26.
//

import Foundation

enum UserRole: Codable
{
    case student;
    case manager;
}

enum Profile: Codable
{
    case student(Student);
    case manager(Manager);
}

struct User: Identifiable, Codable
{
    let id: UUID;
    let university: UUID; // University id
    
    var name: String;
    var email: String;
    var role: UserRole;
    var profile: Profile;
}

struct Student: Codable
{
    var homeStopID: UUID?;
    
    /// Daily timings
    /// Index 0: Monday [morning, evening]
    /// Index 1: Tuesday [morning, evening] and so on...
    var timings: [[Time?]];
}

struct Manager: Codable
{
    var isAdmin: Bool;
}
