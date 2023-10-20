//
//  CastPlayerView.swift
//  ProximityVideoPlayer
//
//  Created by Jeevan Eashwar on 19/10/23.
//

import Foundation
import SwiftUI

/// This View contains the page title and the UIViewRepresentable player view that contains the AVPlayer
struct CastPlayerView: View {
    @StateObject private var viewModal = CastViewModal()
    var body: some View {
        VStack {
            // Page title
            Text(Constants.DisplayName)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding()
            // This View contains the AVPlayer to play the media
            VideoPlayerView(viewModal: viewModal)
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)
            Button(action: {
                self.viewModal.toggleCasting()
            }) {
                Text(viewModal.castButtonState.rawValue)
                    .font(.headline)
                    .frame(width: 200, height: 60)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

struct CastPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        CastPlayerView()
    }
}
