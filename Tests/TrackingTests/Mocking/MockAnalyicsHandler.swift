//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 10.09.21.
//

import Foundation
import Tracking
import XCTest

class MockAnalyticsFilter: AnalyticsFilter {
    var shouldSendBehaviour: ((Event, AnalyticsHandler) -> Bool)?
    
    func shouldSend(event: Event, targetHandler: AnalyticsHandler) -> Bool {
        guard let behaviour = shouldSendBehaviour else {
            XCTFail("No behaviour for shouldSend was confgured")
            return false
        }
        
        return behaviour(event, targetHandler)
    }
}
