//
//  Binify_Demo_0_1App.swift
//  Binify_Demo_0.1
//
//  Created by Prithika Venkatesh on 4/8/25.
//

import SwiftUI
import FirebaseCore 

@main
struct Binify_Demo_0_1App: App {
    
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


