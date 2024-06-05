//
//  ErrorWrapper.swift
//  TripPlanner
//
//  Created by Daniel Paymar on 6/5/24.
//

import SwiftUI

struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String
    
    init(id: UUID = UUID(), error: Error, guidance: String) {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
