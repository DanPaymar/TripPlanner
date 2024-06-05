//
//  Model.swift
//  TripPlanner
//
//  Created by Daniel Paymar on 6/5/24.
//

import SwiftUI

struct Activity: Identifiable, Codable {
    var id: UUID
    var title: String
    var gear: [Gear]
    
    var theme: Theme
    
    // initialize with default values
    init(id: UUID = UUID(), title: String, gear: [String], theme: Theme) {
        self.id = id
        self.title = title
        self.gear = gear.map { Gear(name: $0)}
        self.theme = theme
    }
}

extension Activity {
    struct Gear: Identifiable, Codable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    // create an empty activity
    static var emptyTrip: Activity {
        Activity(title: "", gear: [], theme: .bubblegum)
    }
}


extension Activity {
  static let SampleData: [Activity] = [
    Activity(title: "Backpacking",
             gear: ["backpack", "water filter", "water bottle", "tent", "cooking burner"], theme: .buttercup),
    
    Activity(title: "Climbing", 
             gear: ["rope", "more rope"], theme: .navy),
    
    Activity(title: "Day hik", 
             gear: ["water","snacks","trident"], theme: .oxblood)
  ]
}
