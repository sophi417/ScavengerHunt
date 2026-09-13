# Project 1 - *Scavenger Hunt*

Submitted by: **Sophia Sartor**

**Scavenger Hunt** is an app that gives the user a list of photo tasks to complete. The user picks a task, attaches a photo from their library, and the app marks the task complete and drops a pin on a map showing where that photo was taken.

Time spent: 8 hours spent in total

## Required Features

The following **required** functionality is completed:

- [x] App displays list of hard-coded tasks
- [x] When a task is tapped it navigates the user to a task detail view
- [x] When user adds photo to complete the tasks, it marks the task as complete
- [x] When adding photo of task, the location is added
- [x] User returns to home page (list of tasks) and the status of your task is updated to complete
 
The following **optional** features are implemented:

- [ ] User can launch camera to snap a picture	

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

## Video Walkthrough

Here is a reminder on how to embed Loom videos on GitHub. Feel free to remove this reminder once you upload your README. 

[[Guide]](https://www.youtube.com/watch?v=GA92eKlYio4) .](https://youtu.be/h1eIhAfYBf4)

## Notes

Describe any challenges encountered while building the app.

The trickiest part was getting the location out of the attached photo. At first no location came through because the picker returns an anonymous image by default. I had to configure PHPicker with the shared photo library so the results include an asset identifier, then use that to look up the photo's location in PhotoKit. It also needed the photo library permission in Info and full access granted, and the photo itself had to actually have GPS data — the simulator's built-in sample photos don't, so I dragged in a photo with location data to test. Wrapping the UIKit picker in a UIViewControllerRepresentable so SwiftUI could use it was also new to me.

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
