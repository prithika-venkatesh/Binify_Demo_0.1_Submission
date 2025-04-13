//
//  ContentView.swift
//  Binify_Demo_0.1
//
//  Created by Prithika Venkatesh on 4/8/25.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var selectedImage: UIImage?
    @State private var predictionResult: String = ""
    @State private var suggestedBin: String = ""
    @State private var showPicker = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Garbage Classifier")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)
                
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .cornerRadius(16)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray.opacity(0.5))
                }
                
                Button("Scan Trash") {
                    showPicker = true
                }
                .padding()
                .background(Color.green.opacity(0.8))
                .foregroundColor(.white)
                .clipShape(Capsule())
                
                if !predictionResult.isEmpty {
                    Text("Item: \(predictionResult)")
                        .font(.headline)
                    Text("Suggested Bin: \(suggestedBin)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                NavigationLink(destination: HomeView()) {
                    Text("⬅️ Back to Home")
                        .foregroundColor(.blue)
                        .padding(.top)
                }
            }
            .sheet(isPresented: $showPicker) {
                PhotoPicker(image: $selectedImage, onImagePicked: classifyImage)
            }
            .padding()
        }
    }

    // ✅ Outside of the body now
    func classifyImage(_ image: UIImage?) {
        let sampleItems = ["Plastic Bottle", "Banana Peel", "Styrofoam"]
        predictionResult = sampleItems.randomElement() ?? "Unknown"
        suggestedBin = binForItem(predictionResult)
    }

    func binForItem(_ item: String) -> String {
        switch item.lowercased() {
            case "plastic bottle": return "Recycle"
            case "banana peel": return "Compost"
            case "styrofoam": return "Landfill"
            default: return "Check Sorting Guide"
        }
    }
}

#Preview {
    ContentView()
}

