//
//  PlayerViewController.swift
//  ProximityVideoPlayer
//
//  Created by Jeevan Eashwar on 19/10/23.
//

import UIKit
import AVKit

/// Parent view controller of the AVPlayerViewController and the third party SDK's cast button.
/// The cast button comes from viewModal's castManager class that conforms to castService protocol and hence it is forced to create a cast button
class PlayerViewController: UIViewController {
    var viewModal: CastViewModal!
    private var playerViewController: AVPlayerViewController!
    private var castButton: UIButton!
    
    let space: CGFloat = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addAVPlayerViewController()
        addCastButton()
    }
    
    func beautifyUI() {
        view.backgroundColor = .black
    }
    
    /// Create a AVPlayer with default video that is read from a local file. Go to CastViewModal to change the videoURL
    private func addAVPlayerViewController() {
        // Create AVPlayer and AVPlayerViewController
        let player: AVPlayer
        if let videoURL = viewModal.videoURL {
            player = AVPlayer(url: videoURL)
        } else {
            player = AVPlayer()
        }
        
        playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        addChild(playerViewController)
        view.addSubview(playerViewController.view)
        playerViewController.didMove(toParent: self)
    }
    
    /// The cast button comes from viewModal's castManager class that conforms to castService protocol and hence it is forced to create a cast button
    /// Position the cast button such that it will not overlap with the video controls
    private func addCastButton() {
        // Create Cast Button
        castButton = viewModal.castService.createCastButton()
        let buttonFrame = castButton.frame
        castButton.frame = CGRect(x: view.frame.width * 0.7, y: 10, width: buttonFrame.width, height: buttonFrame.height)
        castButton.backgroundColor = .black
        view.addSubview(castButton)
    }
}
