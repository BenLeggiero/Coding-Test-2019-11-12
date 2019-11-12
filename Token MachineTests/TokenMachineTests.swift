//
//  TokenMachineTests.swift
//  Token MachineTests
//
//  Created by Ben Leggiero on 2019-11-12.
//  Copyright © 2019 Blue Husky Studios. All rights reserved.
//

import XCTest
@testable import Token_Machine



class TokenMachineTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testTiming() {
        let machine = TokenMachine()
        
        let testDuration: TimeInterval = 5
        
        var latestResult: TokenMachine.DispenseResult? = nil
        var latestAmount: UInt = .max
        var lastRefillSuccess = Date()
        
        let start = Date()
        while -start.timeIntervalSinceNow <= testDuration {
            let dispenseResult = machine.dispense()
            let newAmount = machine.container.tokenCount
            if latestResult != dispenseResult
                || newAmount != latestAmount
            {
                let now = Date()
                print(now.timeIntervalSince(start) * 1000, dispenseResult, newAmount)
                
                XCTAssert((now.timeIntervalSince(lastRefillSuccess) - 1.001) < 1)
                lastRefillSuccess = now
            }
            latestResult = dispenseResult
            latestAmount = newAmount
        }
    }
}
