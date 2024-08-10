//
//  ImageView.swift
//  Danendra-Darmawansyah_SUITMEDIA-Test
//
//  Created by Kleo Handayani on 10/08/24.
//

import SwiftUI
import PhotosUI

struct ImageView: View {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedImage: PhotosPickerItem? = nil

    var body: some View {
        VStack {
            PhotosPicker(
                selection: $selectedImage,
                matching: .images,
                photoLibrary: .shared()
            ) {
                Text("Select a Photo")
            }
            .onChange(of: selectedImage) { newItem in
                Task {
                    if let newItem = selectedImage {
                        do {
                            if let data = try await newItem.loadTransferable(type: Data.self) {
                                image = UIImage(data: data)
                                print("Image loaded successfully")
                                presentationMode.wrappedValue.dismiss()
                            }
                        } catch {
                            print("Failed to load image: \(error)")
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
        }
    }
}
