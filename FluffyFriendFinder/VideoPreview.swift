//
//  VideoPreview.swift
//  FluffyFriendFinder
//
//  Created by Matusalem Marques on 06/07/2020.
//

import UIKit
import AVFoundation

class VideoPreview: UIView {
    override class var layerClass: AnyClass {
        AVCaptureVideoPreviewLayer.self
    }

    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        layer as! AVCaptureVideoPreviewLayer
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        if superview != nil {
            videoPreviewLayer.session?.startRunning()
        } else {
            videoPreviewLayer.session?.stopRunning()
        }
    }
}
