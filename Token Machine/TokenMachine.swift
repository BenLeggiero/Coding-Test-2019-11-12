//
//  TokenMachine.swift
//  Token Machine
//
//  Created by Ben Leggiero on 2019-11-12.
//  Copyright © 2019 Blue Husky Studios. All rights reserved.
//

import Foundation



internal class TokenMachine {
    internal fileprivate(set) var container: TokenMachineContainer
    fileprivate var singleAccessQueue: DispatchQueue
    fileprivate var lastRefillDate = Date()
    internal let refillInterval: TimeInterval
    
    
    
    init(initialContents: TokenMachineContainer = .init(), refillInterval: TimeInterval = 1) {
        self.container = initialContents
        self.refillInterval = refillInterval
        self.singleAccessQueue = DispatchQueue(
            label: "Token machine single access queue \(TokenMachine.accessQueueCount)",
            qos: .userInteractive
        )
    }
}



fileprivate extension TokenMachine {

    static var _accessQueueCount: UInt = 0
    static var accessQueueCount: UInt {
        get {
            _accessQueueCount += 1
            return _accessQueueCount
        }
    }
}



internal extension TokenMachine {
    
    func dispense() -> DispenseResult {
        return singleAccessQueue.sync {
            if -lastRefillDate.timeIntervalSinceNow >= refillInterval {
                container.refill()
                lastRefillDate = Date()
            }
            
            return container.dispense()
        }
    }
    
    
    
    typealias DispenseResult = TokenMachineContainer.DispenseResult
}
