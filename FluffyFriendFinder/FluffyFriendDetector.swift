//
//  FluffyFriendDetector.swift
//  FluffyFriendFinder
//
//  Created by Matusalem Marques on 06/07/2020.
//

import AVFoundation
import Vision
import SwiftUI

class FluffyFriendDetector: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate, ObservableObject {
    @Published var friends: [FluffyFriend] = []
    
    lazy var request = { VNRecognizeAnimalsRequest(completionHandler: self.handleRequest) }()

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        try? VNImageRequestHandler(cmSampleBuffer: sampleBuffer, orientation: .right).perform([request])
    }

    func handleRequest(_ request: VNRequest, error: Error?) {
        guard let results = request.results as? [VNRecognizedObjectObservation] else { return }

        DispatchQueue.main.async {
            self.friends = results.map(FluffyFriend.init(observation:))
        }
    }
}

