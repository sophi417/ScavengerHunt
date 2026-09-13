//
//  TaskDetailView.swift
//  ScavengerHunt
//
//  Created by Sophia Sartor
//

import SwiftUI
import UIKit
import CoreLocation
import MapKit

struct TaskDetailView: View {
    let task: ScavengerTask

    @State private var showingPicker = false   // controls whether the picker is up

    var body: some View {
        VStack(spacing: 16) {
            Text(task.title)
                .font(.title)
                .bold()

            Text(task.details)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            // show the photo once one is attached
            if let photo = task.photo {
                Image(uiImage: photo)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 250)
            }
            // show a map with a pin where the photo was taken
            if let coordinate = task.coordinate {
                Map {
                    Marker("Photo taken here", coordinate: coordinate)
                }
                .frame(height: 250)
                .cornerRadius(12)
            }
            // opens the photo picker
            Button {
                showingPicker = true
            } label: {
                Text(task.isComplete ? "Photo Attached" : "Attach Photo")
            }
            .buttonStyle(.borderedProminent)
            .disabled(task.isComplete)

            Spacer()
        }
        .padding()
        .navigationTitle("Task")
        // pops the picker up as a sheet, saves the photo when they pick one
        .sheet(isPresented: $showingPicker) {
            PhotoPicker { image, coordinate in
                task.photo = image
                task.coordinate = coordinate
                task.isComplete = true
            }
        }
    }
}
