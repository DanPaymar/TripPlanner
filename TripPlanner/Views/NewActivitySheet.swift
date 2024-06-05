//
//  NewActivitySheet.swift
//  TripPlanner
//
//  Created by Daniel Paymar on 6/5/24.
//

import SwiftUI

struct NewActivitySheet: View {
    @State private var newTrip = Activity.emptyTrip
    @Binding var trips: [Activity]
    @Binding var isPresentingNewTripView: Bool
    
    var body: some View {
        NavigationStack {
            DetailView(trip: $newTrip)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewTripView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            trips.append(newTrip)
                            isPresentingNewTripView = false
                        }
                    }
                }
        }
    }
}


#Preview {
    NewActivitySheet(trips: .constant(Activity.SampleData), isPresentingNewTripView: .constant(true))
}
