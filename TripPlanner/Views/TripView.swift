//
//  ContentView.swift
//  TripPlanner
//
//  Created by Daniel Paymar on 6/5/24.
//

import SwiftData
import SwiftUI

struct TripView: View {
    @Binding var trips: [Activity]
    @Environment(\.scenePhase) private var scenePhase
    
    @State private var trip: [Trip] = []
    @State private var isPresentingNewActivityView = false
    
    let saveAction: () ->Void
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($trips) { $trip in
                    NavigationLink(destination: DetailView(trip: $trip)) {
                        CardView(trip: trip)
                    }
                    .listRowBackground(trip.theme.mainColor)

                }
                .onDelete { indexSet in
                    trips.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Adventures")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isPresentingNewActivityView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .overlay {
                if trips.isEmpty {
                    ContentUnavailableView("You don't have any adventures planned." ,
                                           systemImage: "figure.hiking",
                                           description: Text("Use the '+' to add some fun."))
                }
            }
            
        }
        .sheet(isPresented: $isPresentingNewActivityView) {
            NewActivitySheet(trips: $trips, isPresentingNewTripView: $isPresentingNewActivityView)
        }
                .onChange(of: scenePhase) { phase in
                    if phase == .inactive { saveAction() }
                }
    }
    
}
#Preview {
                TripView(trips: .constant(Activity.SampleData), saveAction: {})
}
