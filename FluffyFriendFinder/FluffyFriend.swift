//
//  FluffyFriend.swift
//  FluffyFriendFinder
//
//  Created by Matusalem Marques on 06/07/2020.
//

import Foundation
import CoreGraphics
import SwiftUI
import Vision

struct FluffyFriend: Identifiable {
    var id = UUID()
    var species: String

    var boundingBox: CGRect

    var boundingBoxColor: Color {
        switch species {
        case VNAnimalIdentifier.cat.rawValue:
            return .red
        case VNAnimalIdentifier.dog.rawValue:
            return .green
        default:
            return .gray
        }
    }

    init(observation: VNRecognizedObjectObservation) {
        species = observation.labels.first?.identifier ?? "Some animal"
        boundingBox = observation.boundingBox
    }
}
