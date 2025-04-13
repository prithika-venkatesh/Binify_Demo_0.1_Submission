//
//  HomeView.swift
//  Binify_Demo_0.1
//
//  Created by Prithika Venkatesh on 4/8/25.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
                Text("♻️ Binify")
                    .font(.system(size: 40, weight: .bold))
                
                Text("Tap below to start classifying your trash!")
                    .font(.headline)
                    .multilineTextAlignment(.center)

                NavigationLink(destination: ContentView()) {
                    Text("Start Classifying")
                        .padding()
                        .frame(width: 200)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
