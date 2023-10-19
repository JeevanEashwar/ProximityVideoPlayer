//
//  PlayerView.swift
//  ProximityVideoPlayer
//
//  Created by Jeevan Eashwar on 19/10/23.
//

import SwiftUI
import AVKit

/// This view should conform to UIViewControllerRepresentable inorder to bind with UIViewController to support AVPlayer.
/// This is a wrapper of UIViewController that contains the AVPlayer
struct VideoPlayerView: UIViewControllerRepresentable {
    private var viewModal: CastViewModal
    
    init(viewModal: CastViewModal) {
        self.viewModal = viewModal
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let playerViewController: PlayerViewController = PlayerViewController()
        playerViewController.viewModal = viewModal
        return playerViewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Update the view controller if needed
    }
}

