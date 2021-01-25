//
//  AppDelegate.swift
//  Screencast Buddy
//
//  Created by Valentine Silvansky on 25.01.2021.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        NSUserDefaultsController.shared.initialValues = [ "cornerRadius" : 10, "mirror" : true, "fill" : true ]
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

