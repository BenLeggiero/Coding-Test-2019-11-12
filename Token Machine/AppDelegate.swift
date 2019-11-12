//
//  AppDelegate.swift
//  Token Machine
//
//  Created by Ben Leggiero on 2019-11-12.
//  Copyright © 2019 Blue Husky Studios. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    fileprivate var tokenMachine: TokenMachine!
    @IBOutlet weak var statusLabel: NSTextField!
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        tokenMachine = TokenMachine(initialContents: TokenMachineContainer())
//        statusLabel.stringValue = tokenMachine.descriptionForUi
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}



private extension AppDelegate {

    @IBAction func didPressDispenseButton(_ sender: NSButton) {
        
    }
}



private extension TokenMachine {
//    var descriptionForUi: String {
//        if container.isFull {
//            
//        }
//    }
}

