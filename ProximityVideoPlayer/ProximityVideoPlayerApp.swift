//
//  ProximityVideoPlayerApp.swift
//  ProximityVideoPlayer
//
//  Created by Jeevan Eashwar on 19/10/23.
//

import SwiftUI

/// Application Main View
@main
struct ProximityVideoPlayerApp: App {
    init() {
        /// You can initialize the third party cast SDKs like Google Cast SDK here
        CastManager.initializeCast()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
