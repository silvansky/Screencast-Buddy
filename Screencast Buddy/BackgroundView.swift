//
//  BackgroundView.swift
//  Screencast Buddy
//
//  Created by Valentine Silvansky on 25.01.2021.
//

import Cocoa

class BackgroundView: NSView {

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

        layer?.backgroundColor = .black
        layer?.cornerRadius = 10
    }
}
