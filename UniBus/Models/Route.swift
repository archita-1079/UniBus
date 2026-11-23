//
//  Route.swift
//  UniBus
//
//  Created by Super Charge 1 on 23/11/26.
//

import Foundation

struct PickupStop
{
    var name: String;
    
    var latitude: Double;
    var longitude: Double;
}

struct Route: Identifiable
{
    let id: UUID;
    let universityId: UUID;
    
    var stops: [PickupStop]; // Id's of pickup stops
}
