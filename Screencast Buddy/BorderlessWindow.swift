//
//  BorderlessWindow.swift
//  Screencast Buddy
//
//  Created by Valentine Silvansky on 25.01.2021.
//

import Cocoa

class BorderlessWindow: NSWindow {

    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: [.borderless, .resizable], backing: backingStoreType, defer: flag)

        isOpaque = false
        isRestorable = true
        backgroundColor = .clear
        isMovableByWindowBackground = true

        level = .floating + 100
    }

    override var canBecomeKey: Bool { true }

    override var canBecomeMain: Bool { true }
}
