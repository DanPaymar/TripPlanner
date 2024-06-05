//
//  CardView.swift
//  TripPlanner
//
//  Created by Daniel Paymar on 6/5/24.
//


import SwiftUI

struct CardView: View {
    let trip: Activity
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(trip.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            
            HStack {
                Label("\(trip.title)", systemImage: "person.3")
                    .accessibilityLabel("\(trip.gear.count) attendees")
                Spacer()
                Label("\(trip.gear.count)", systemImage: "backpack")
                    .accessibilityLabel("\(trip.gear) minute meeting")
                    .labelStyle(.automatic)
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(trip.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var trip = Activity.SampleData[0]
    
    static var previews: some View {
        CardView(trip: trip)
            .background(trip.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
