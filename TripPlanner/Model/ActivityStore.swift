//
//  ActivityStore.swift
//  TripPlanner
//
//  Created by Daniel Paymar on 6/5/24.
//


import SwiftUI

@MainActor
class ActivityStore: ObservableObject {
    @Published var trips: [Activity] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("scrums.data")
    }
    
    func load() async throws {
        let task = Task<[Activity], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let newActivity = try JSONDecoder().decode([Activity].self, from: data)
            return newActivity
        }
        let trips = try await task.value
        self.trips = trips
    }
    
    func save(trips: [Activity]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(trips)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        // underscore indicates no interest in result of task.value
        _ = try await task.value
    }
}
