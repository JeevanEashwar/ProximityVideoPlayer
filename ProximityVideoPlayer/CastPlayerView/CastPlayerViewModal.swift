//
//  CastPlayerViewModal.swift
//  ProximityVideoPlayer
//
//  Created by Jeevan Eashwar on 19/10/23.
//

import Foundation
import SwiftUI

/// This enumeration is to maintain the state of the start casting button
enum CastButtonState: String {
    case CAST = "Start Casting"
    case STOP = "Stop Casting"
    
    mutating func toggle() {
        switch self {
        case .CAST:
            self = .STOP
        case .STOP:
            self = .CAST
        }
    }
}

/// View modal class that handles two tasks
/// 1. Get the videoURL of the media that has to be played in the AVPlayer or to be casted to any available device
///   Note: For now i have put my media file in the Videos folder. If you want to change the media or play a different video, make sure to update the file resource name.
/// 2. CastService that will give us the cast button and cast the video over to any available device
///   Note: For now, since we are dealing with local media files and we are sure that the file exists, I am triggering fatalError but it has to be properly handled
class CastViewModal: ObservableObject {
    
    @Published var castButtonState: CastButtonState = .CAST
    
    @Published var videoURL: URL?
    let castService: CastService

    init(castService: CastService = CastManager()) {
        self.castService = castService
        /// File resource name can be changed here instead of Constants.VideoFile.Name
        if let videoPath = Bundle.main.path(forResource: Constants.VideoFile.Name, ofType: Constants.VideoFile.Extension) {
            self.videoURL = URL(fileURLWithPath: videoPath)
        } else {
            fatalError(Constants.VideoFile.NotFound)
        }
    }
    
    func toggleCasting() {
        switch castButtonState {
        case .CAST:
            startCasting()
        case .STOP:
            stopCasting()
        }
        castButtonState.toggle()
    }
    
    private func startCasting() {
        if let videoURL = videoURL {
            castService.startCasting(mediaURL: videoURL)
        }
    }
    
    private func stopCasting() {
        castService.stopCasting()
    }
}

