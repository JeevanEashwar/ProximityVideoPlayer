//
//  ContentView.swift
//  ProximityVideoPlayer
//
//  Created by Jeevan Eashwar on 19/10/23.
//

import SwiftUI

/// ContainerView of CastPlayerView added just in case any frame modifications or additional controls can be added here
struct ContentView: View {
    var body: some View {
        VStack {
            CastPlayerView()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
