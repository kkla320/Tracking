//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 10.09.21.
//

import Foundation
import Tracking

class MockAnalyticsHandler: AnalyticsHandler {
    var logEventCalls: [Call]
    
    init() {
        logEventCalls = []
    }
    
    func log(event: Event) {
        logEventCalls.append(Call(arguments: [
            "event": event
        ]))
    }
}
