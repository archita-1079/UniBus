//
//  University.swift
//  navigation
//
//  Created by Super Charge 1 on 23/11/26.
//

import Foundation

struct Time
{
    let hour: Int;
    let minute: Int;
}

struct University: Identifiable
{
    let id = UUID();
    
    let name: String;
    let emailDomains: [String]; /// [ geu.ac.in, gehu.ac.in ]
    let departureTimings: [Time]; /// 24-hour format i.e. [8:00, 14:00]
    let pickupStops: [String];
}
