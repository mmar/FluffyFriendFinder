//
//  FluffyFriendFinderApp.swift
//  FluffyFriendFinder
//
//  Created by Matusalem Marques on 02/07/2020.
//

import SwiftUI

@main
struct FluffyFriendFinderApp: App {
    @ObservedObject
    private var detector = FluffyFriendDetector()

    var body: some Scene {
        WindowGroup {
            ZStack {
                CameraView(sampleBufferDelegate: detector)
                GeometryReader { geometry in
                    ForEach(detector.friends) { friend in
                        ZStack {
                            RoundedRectangle(cornerRadius: 2)
                                .stroke()
                                .frame(width: friend.boundingBox.width * geometry.size.width, height: friend.boundingBox.height * geometry.size.height, alignment: .center)
                            Text(friend.species)
                                .padding(4)
                                .frame(width: friend.boundingBox.width * geometry.size.width, height: friend.boundingBox.height * geometry.size.height, alignment: .topLeading)
                        }
                        .position(x: friend.boundingBox.midX * geometry.size.width, y: (1 - friend.boundingBox.midY) * geometry.size.height)
                        .foregroundColor(friend.boundingBoxColor)
                    }
                }
            }
        }
    }
}
