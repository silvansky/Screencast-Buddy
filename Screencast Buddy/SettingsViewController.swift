//
//  SettingsViewController.swift
//  Screencast Buddy
//
//  Created by Valentine Silvansky on 25.01.2021.
//

import Cocoa

class SettingsViewController: NSViewController {

    @IBOutlet weak var cornerRadiusLabel: NSTextField!
    @IBOutlet weak var cornerRadiusSlider: NSSlider!
    @IBOutlet weak var mirrorSwitch: NSSwitch!
    @IBOutlet weak var fillSwitch: NSSwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
