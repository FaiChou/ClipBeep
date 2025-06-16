//
//  main.swift
//  ClipBeep
//
//  Created by FaiChou on 2025/6/16.
//

import Foundation
import AppKit

/**
     Basso.aiff     Bottle.aiff    Funk.aiff      Hero.aiff      Ping.aiff      Purr.aiff      Submarine.aiff
     Blow.aiff      Frog.aiff      Glass.aiff     Morse.aiff     Pop.aiff       Sosumi.aiff    Tink.aiff
 */
let BEEP_NAME = "Frog"

class ClipboardMonitor {
    private var timer: Timer?
    private var lastChangeCount = NSPasteboard.general.changeCount

    init() {
        startMonitoring()
        RunLoop.current.run()
    }

    private func startMonitoring() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.checkClipboard()
        }
    }

    private func checkClipboard() {
        let pasteboard = NSPasteboard.general
        if pasteboard.changeCount != lastChangeCount {
            lastChangeCount = pasteboard.changeCount
            NSSound(named: NSSound.Name("Frog"))?.play()
        }
    }
}

_ = ClipboardMonitor()
