//
//  VideoView.swift
//  Screencast Buddy
//
//  Created by Valentine Silvansky on 25.01.2021.
//

import Cocoa
import AVFoundation

class VideoView: NSView {

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)

        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setUp()
    }

    private func setUp() {
        wantsLayer = true

        layer = AVCaptureVideoPreviewLayer()
        videoPreviewLayer.videoGravity = .resizeAspectFill
    }

    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
}
