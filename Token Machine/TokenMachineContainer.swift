//
//  TokenMachineContainer.swift
//  Token Machine
//
//  Created by Ben Leggiero on 2019-11-12.
//  Copyright © 2019 Blue Husky Studios. All rights reserved.
//

import Foundation



internal struct TokenMachineContainer {
    var tokenCount: UInt
    var tokenRefillSize: UInt
    var maxTokenCount: UInt
}



// MARK: - Initialization

internal extension TokenMachineContainer {
    
    init() {
        self.tokenCount = TokenMachineContainer.defaultInitialTokenCount
        self.tokenRefillSize = TokenMachineContainer.defaultTokenRefillSize
        self.maxTokenCount = TokenMachineContainer.defaultInitialTokenCount
    }
    
    
    init?(initialTokenCount: UInt = TokenMachineContainer.defaultInitialTokenCount,
          tokenRefillSize: UInt = TokenMachineContainer.defaultTokenRefillSize,
          maxTokenCount: UInt? = nil
    )
    {
        let maxTokenCount = maxTokenCount ?? initialTokenCount
        
        guard
            tokenRefillSize <= maxTokenCount,
            initialTokenCount <= maxTokenCount
            else
        {
            return nil
        }
        
        self.tokenCount = initialTokenCount
        self.tokenRefillSize = tokenRefillSize
        self.maxTokenCount = maxTokenCount
    }
    
    
    
    static let defaultInitialTokenCount: UInt = 20
    static let defaultTokenRefillSize: UInt = 10
}



// MARK: - Functionality

internal extension TokenMachineContainer {
    
    mutating func dispense() -> DispenseResult {
        if tokenCount > 0 {
            self.tokenCount -= 1
            return .didDispense
        }
        else {
            return .empty
        }
    }
    
    
    
    mutating func refill() {
        tokenCount = min(maxTokenCount, tokenCount + tokenRefillSize)
    }
    
    
    var isFull: Bool {
        return tokenCount == tokenRefillSize
    }
    
    
    
    enum DispenseResult {
        case didDispense
        case empty
    }
}
