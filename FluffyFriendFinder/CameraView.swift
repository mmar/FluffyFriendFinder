//
//  PreviewView.swift
//  FluffyFriendFinder
//
//  Created by Matusalem Marques on 06/07/2020.
//

import SwiftUI
import AVFoundation

struct CameraView: UIViewRepresentable {
    typealias UIViewType = VideoPreview

    var sampleBufferDelegate: AVCaptureVideoDataOutputSampleBufferDelegate
    var sampleBufferQueue = DispatchQueue(label: "sampleBufferQueue")

    func makeUIView(context: UIViewRepresentableContext<CameraView>) -> VideoPreview {
        AVCaptureDevice.requestAccess(for: .video) { _ in }

        let videoPreview = VideoPreview()

        videoPreview.videoPreviewLayer.session = makeCaptureSession()
        videoPreview.videoPreviewLayer.videoGravity = .resize

        return videoPreview
    }

    func updateUIView(_ uiView: VideoPreview, context: UIViewRepresentableContext<CameraView>) {
    }

    private func makeCaptureSession() -> AVCaptureSession? {
        let session = AVCaptureSession()
        session.beginConfiguration()

        guard let videoDevice = AVCaptureDevice.default(for: .video),
              let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice),
              session.canAddInput(videoDeviceInput) else {
            return nil
        }
        session.addInput(videoDeviceInput)

        let videoOutput = AVCaptureVideoDataOutput()

        guard session.canAddOutput(videoOutput) else { return nil }

        session.addOutput(videoOutput)
        videoOutput.setSampleBufferDelegate(sampleBufferDelegate, queue: sampleBufferQueue)

        session.commitConfiguration()
        return session
    }

}
