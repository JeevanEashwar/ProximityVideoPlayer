//
//  CastManager.swift
//  ProximityVideoPlayer
//
//  Created by Jeevan Eashwar on 19/10/23.
//

import Foundation
import GoogleCast

/// Using a protocol to force the Castmanager to implement certain mandatory methods to initialize, cast, etc.,
/// NOTE: Ideally, the methods and variables also should be made generic and not depend on GoogleCast. It can be done by creating another protocol that contains generic context and button type(instead of specific GCKUICastButton
protocol CastService {
    var context: GCKCastContext { get }
    
    static func initializeCast()
    
    func createCastButton() -> GCKUICastButton
    func castVideo(mediaURL: URL)
}

class CastManager: CastService {
    
    /// Exposed this context as a wrapper because the App might require to perform certain operations/video controls in future and the app need not know about which SDK's Context to use,
    /// TODO: Replace GCKCastContext with generic protocol and make it SDK agnostic
    var context: GCKCastContext {
        GCKCastContext.sharedInstance()
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
    func createCastButton() -> GCKUICastButton {
        let castButton = GCKUICastButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        castButton.tintColor = UIColor.white
        castButton.isHidden = false
        return castButton
    }
    
    /// This will be called inorder to play the media on a connected casting device.
    /// TODO: Still looking into documentation as to when and how to trigger this method. Since i do not have a casting set up, left this as future work
    func castVideo(mediaURL: URL) {
        let mediaInfoBuilder = GCKMediaInformationBuilder.init(contentURL: mediaURL)
        mediaInfoBuilder.streamType = GCKMediaStreamType.none;
        mediaInfoBuilder.contentType = "video/mp4"
        let mediaInfo = mediaInfoBuilder.build()
        
        let _ = context.sessionManager.currentSession?.remoteMediaClient?.loadMedia(mediaInfo)
    }
}

