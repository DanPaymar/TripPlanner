//
//  TripPlannerApp.swift
//  TripPlanner
//
//  Created by Daniel Paymar on 6/5/24.
//

import SwiftUI

@main
struct TripPlannerApp: App {
   
    @StateObject private var store = ActivityStore()
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            TripView(trips: $store.trips) {
                // save to trips store or halt exectution if save() throws an error
                Task {
                    do {
                        try await store.save(trips: store.trips)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                    }
                }
            }
            .task {
                // load user trips when app root view appears
                do {
                    try await store.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "Trip Planner will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper) {
                store.trips = Activity.SampleData
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
