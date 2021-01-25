//
//  ViewController.swift
//  Screencast Buddy
//
//  Created by Valentine Silvansky on 25.01.2021.
//

import Cocoa
import AVFoundation
import AVKit

class ViewController: NSViewController {

    var session: AVCaptureSession?

    @objc var cornerRadius: Float = 10 {
        didSet {
            view.layer?.cornerRadius = CGFloat(cornerRadius)
            //view.window?.setFrame(view.window!.frame, display: true, animate: false)
            view.window?.display()
        }
    }
    @objc var mirror: Bool = true {
        didSet {
            if let connection = videoView.videoPreviewLayer.connection,
               connection.isVideoMirroringSupported {
                connection.automaticallyAdjustsVideoMirroring = false
                connection.isVideoMirrored = mirror
            }
        }
    }
    @objc var fill: Bool = true {
        didSet {
            videoView.videoPreviewLayer.videoGravity = fill ? .resizeAspectFill : .resizeAspect
        }
    }

    @IBOutlet weak var videoView: VideoView!

    override func viewDidLoad() {
        super.viewDidLoad()

        checkCameraAccess()

        bind(NSBindingName(rawValue: "cornerRadius"), to: NSUserDefaultsController.shared, withKeyPath: "values.cornerRadius", options: nil)
        bind(NSBindingName(rawValue: "mirror"), to: NSUserDefaultsController.shared, withKeyPath: "values.mirror", options: nil)
        bind(NSBindingName(rawValue: "fill"), to: NSUserDefaultsController.shared, withKeyPath: "values.fill", options: nil)
    }

    private func checkCameraAccess() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized: // The user has previously granted access to the camera.
            setupSession()
        case .notDetermined: // The user has not yet been asked for camera access.
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    DispatchQueue.main.async {
                        self.setupSession()
                    }
                }
            }

            // TODO: Show alert
        case .denied: // The user has previously denied access.
            return
        case .restricted: // The user can't grant access due to restrictions.
            return
        @unknown default:
            return
        }
    }

    private func setupSession() {
        let captureSession = AVCaptureSession()
        session = captureSession

        captureSession.beginConfiguration()

        let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .unspecified)
        guard
            let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!),
            captureSession.canAddInput(videoDeviceInput)
            else { return }

        captureSession.addInput(videoDeviceInput)

        captureSession.commitConfiguration()

        videoView.videoPreviewLayer.session = captureSession

        if let connection = videoView.videoPreviewLayer.connection,
           connection.isVideoMirroringSupported {
            connection.automaticallyAdjustsVideoMirroring = false
            connection.isVideoMirrored = true
        }

        captureSession.startRunning()
    }
}

