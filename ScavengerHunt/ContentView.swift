//
//  ContentView.swift
//  ScavengerHunt
//
//  Created by Sophia Sartor
//

import SwiftUI

struct ContentView: View {
    // the hunt tasks, starting from the hardcoded ones
    @State private var tasks = ScavengerTask.sampleTasks

    var body: some View {
        NavigationStack {
            List(tasks) { task in
                NavigationLink {
                    TaskDetailView(task: task)
                } label: {
                    HStack {
                        // filled green check when done, empty circle when not
                        Image(systemName: task.isComplete ? "checkmark.circle.fill" : "circle")
                            .foregroundStyle(task.isComplete ? .green : .gray)

                        VStack(alignment: .leading) {
                            Text(task.title)
                                .font(.headline)
                            Text(task.details)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Scavenger Hunt")
        }
    }
}

#Preview {
    ContentView()
}
