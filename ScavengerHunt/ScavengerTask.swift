//
//  ScavengerTask.swift
//  ScavengerHunt
//
//  Created by Sophia Sartor
//

import SwiftUI
import UIKit
import CoreLocation

// making this a class so the list and detail screen share the same task
// that way when i mark one done it shows up on both
@Observable
class ScavengerTask: Identifiable {
    let id = UUID()
    let title: String
    let details: String   // called it details bc description is already taken by swift

    var isComplete = false
    var photo: UIImage?
    var coordinate: CLLocationCoordinate2D?   // where the photo was taken

    init(title: String, details: String) {
        self.title = title
        self.details = details
    }
}

// just some hardcoded tasks to start with
extension ScavengerTask {
    static let sampleTasks: [ScavengerTask] = [
        ScavengerTask(title: "Find a mural", details: "Snap a photo of any street mural or public art."),
        ScavengerTask(title: "Spot some water", details: "Take a picture of a fountain, lake, pool, or the ocean."),
        ScavengerTask(title: "Local eats", details: "Photograph a local restaurant or cafe you like."),
        ScavengerTask(title: "Something green", details: "Capture a park, garden, or a nice tree.")
    ]
}
