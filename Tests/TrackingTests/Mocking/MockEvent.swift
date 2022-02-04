//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 10.09.21.
//

import Foundation
import Tracking

struct MockEvent: Event {
    var name: String = "Mock"
    
    var metadata: Analytics.Metadata?
    
    init(metadata: Analytics.Metadata? = nil) {
        self.metadata = metadata
    }
}

extension Event where Self == MockEvent {
    static func mock(metadata: Analytics.Metadata? = nil) -> MockEvent {
        return MockEvent(metadata: metadata)
    }
}
