//
//  Fleet.swift
//  navigation
//
//  Created by Super Charge 1 on 23/11/26.
//

import Foundation

struct Driver: Identifiable
{
    let id: UUID;
    let universityId: UUID;
    
    var name: String;
}

enum Status
{
    case active;
    case service;
}

struct Fleet: Identifiable
{
    let id: UUID;
    let universityId: UUID;
    
    var number: Int;
    var plateNumber: String;
    var model: String?;
    var driver: Driver?;
    var pickupStop: UUID?;
    var status: Status;
}
