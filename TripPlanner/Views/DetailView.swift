//
//  DetailView.swift
//  TripPlanner
//
//  Created by Daniel Paymar on 6/5/24.
//

import SwiftUI

struct DetailView: View {
    @Binding var trip: Activity
    
    @State private var editingTrip = Activity.emptyTrip
    @State private var isPresentingEditView = false
    var body: some View {
        List {
            Section(header: Text("Destination")) {
                HStack {
                    Label("Trip Destination", systemImage: "backpack")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Trip Type", systemImage: "figure.climbing")
                    Spacer()
                    Text("some text to... ")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Forecast", systemImage: "cloud.heavyrain")
                }
                .accessibilityElement(children: .combine)
            }
            // something like this to show gear added to the trip
//            Section(header: Text("Gear")) {
//                ForEach(data.datapassing) { gear in
//                    Label(gear.name, systemImage: "backpack")
//                }
//            }
        }
        .navigationTitle("Title")
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                editingTrip = trip
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                DetailEditView()
                    .navigationTitle("trip title")
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                                trip = editingTrip
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                trip = editingTrip
                            }
                        }
                    }
            }
        }
    }
}





#Preview {
    
        NavigationStack {
            DetailView(trip: .constant(Activity.emptyTrip))
        }
    
}
