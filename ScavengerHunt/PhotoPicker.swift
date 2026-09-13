//
//  PhotoPicker.swift
//  ScavengerHunt
//
//  Created by Sophia Sartor
//

import SwiftUI
import PhotosUI
import CoreLocation   // for CLLocationCoordinate2D

// swiftui cant show PHPicker directly since its a uikit thing
// so this wraps it up so we can present it like a normal swiftui view
struct PhotoPicker: UIViewControllerRepresentable {
    // hands back the image AND the location (location can be nil if the photo has none)
    var onPick: (UIImage, CLLocationCoordinate2D?) -> Void

    func makeUIViewController(context: Context) -> PHPickerViewController {
        // using the shared library so results include an identifier we can look up
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = .images
        config.selectionLimit = 1

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: PhotoPicker

        init(_ parent: PhotoPicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            guard let result = results.first else { return }

            // look up the photo's location using its identifier
            var coordinate: CLLocationCoordinate2D? = nil
            if let assetId = result.assetIdentifier {
                let assets = PHAsset.fetchAssets(withLocalIdentifiers: [assetId], options: nil)
                coordinate = assets.firstObject?.location?.coordinate
            }

            // load the actual image
            result.itemProvider.loadObject(ofClass: UIImage.self) { object, error in
                if let image = object as? UIImage {
                    DispatchQueue.main.async {
                        self.parent.onPick(image, coordinate)
                    }
                }
            }
        }
    }
}
