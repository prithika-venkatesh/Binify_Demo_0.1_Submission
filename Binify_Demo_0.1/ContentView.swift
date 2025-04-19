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
    @State private var barcodeDetected = ""

    var body: some View {
        NavigationStack {
            ZStack {
                // 🌿 Gradient Background
                LinearGradient(
                    gradient: Gradient(colors: [Color.white, Color(red: 0.85, green: 1.0, blue: 0.85)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Garbage Classifier")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("DarkGreen"))
                        .padding(.top)

                    if let image = selectedImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                            .cornerRadius(16)
                    } else {
                        Image("sign") // Your custom placeholder image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                            .cornerRadius(16)
                    }

                    VStack(spacing: 16) {
                        Button("Scan Trash") {
                            showPicker = true
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green.opacity(0.9))
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(12)

                        Button("Scan Barcode") {
                            simulateBarcodeScan()
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue.opacity(0.9))
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(12)
                    }
                    .padding(.horizontal)

                    if !barcodeDetected.isEmpty {
                        Text("Detected Barcode: \(barcodeDetected)")
                            .font(.headline)
                            .padding()
                    }

                    if !predictionResult.isEmpty {
                        Text("Item: \(predictionResult)")
                            .font(.headline)
                        Text("Suggested Bin: \(suggestedBin)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }

                    Spacer()

                    // Bottom bar can go here if you want
                    NavigationLink(destination: HomeView()) {
                        Text("⬅️ Back to Home")
                            .foregroundColor(.blue)
                            .padding(.top)
                    }
                }
                .padding()
            }
            .sheet(isPresented: $showPicker) {
                PhotoPicker(image: $selectedImage, onImagePicked: classifyImage)
            }
        }
    }

    func classifyImage(_ image: UIImage?) {
        let sampleItems = ["Plastic Bottle", "Banana Peel", "Styrofoam"]
        predictionResult = sampleItems.randomElement() ?? "Unknown"
        suggestedBin = binForItem(predictionResult)
    }

    func simulateBarcodeScan() {
        barcodeDetected = "123456789012"
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
