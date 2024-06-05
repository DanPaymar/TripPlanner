//
//  Trip.swift
//  TripPlanner
//
//  Created by Daniel Paymar on 6/5/24.
//

import SwiftData
import Foundation

@Model
final class Trip: Identifiable {
    var tripName: String
    var tripType: [String]
    var location: String
    
    init(tripName: String, tripType: [String], location: String) {
        self.tripName = tripName
        self.tripType = tripType
        self.location = location
        
    }
}

