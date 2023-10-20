//
//  CastManager.swift
//  ProximityVideoPlayer
//
//  Created by Jeevan Eashwar on 19/10/23.
//

import Foundation
import GoogleCast

/// Using a protocol to force the Castmanager to implement certain mandatory methods to initialize, cast, etc.,
protocol CastService {
    static func initializeCast()
    
    func createCastButton() -> UIButton
    func startCasting(mediaURL: URL)
    func stopCasting()
}

class CastManager: CastService {
    
    private var remoteClient: GCKRemoteMediaClient? {
        GCKCastContext.sharedInstance().sessionManager.currentSession?.remoteMediaClient
    }
    
    /// All the SDKs configuration goes in this method. Usually all SDK initilaizations will be done using shared instance, so marked this as static method so that it can be used in the Appdelegate or in the MainView initializer
    static func initializeCast() {
        let criteria = GCKDiscoveryCriteria(applicationID: Constants.appId)
        let options = GCKCastOptions(discoveryCriteria: criteria)
        GCKCastContext.setSharedInstanceWith(options)
        GCKCastContext.sharedInstance().useDefaultExpandedMediaControls = true
    }
    
    /// This will create and return a GCKUICastButton which when tapped will automatically look for available casting devices.
    /// TODO: Replace GCKUICastButton with UIButton/UIView and make it SDK agnostic
    func createCastButton() -> UIButton {
        let castButton = GCKUICastButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        castButton.tintColor = UIColor.white
        castButton.isHidden = false
        return castButton
    }
    
    /// This will be called inorder to cast the media on a connected casting device.
    func startCasting(mediaURL: URL) {
        let mediaInfoBuilder = GCKMediaInformationBuilder.init(contentURL: mediaURL)
        mediaInfoBuilder.streamType = GCKMediaStreamType.none;
        mediaInfoBuilder.contentType = "video/mp4"
        let mediaInfo = mediaInfoBuilder.build()
        
        remoteClient?.loadMedia(mediaInfo)
    }
    
    /// This will be called inorder to stop the media casting on a connected casting device.
    func stopCasting() {
        remoteClient?.stop()
    }
}

