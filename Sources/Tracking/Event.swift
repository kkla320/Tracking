//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 13.01.21.
//

import Foundation

/**
 An event to track what should be analysed.
 */
public protocol Event {
    /**
     The name of the event
     */
    static var name: String { get }
    /**
     Default metadata that will be send. It will be overridden if the parameters parameter defines the same metadata
     */
    var defaultMetadata: Analytics.Metadata? { get }
}

//extension Event {
//    /**
//    Initializes an event.
//     - Parameters:
//        - name: The name of the event
//        - defaultMetadata: Default metadata that will be send. It will be overridden if the parameters parameter defines the same metadata
//     */
//    public init(name: String, defaultMetadata: Analytics.Metadata? = nil) {
//        self.name = name
//        self.defaultMetadata = defaultMetadata
//    }
//}

//extension Event {
//    public typealias StringLiteralType = String
//
//    public init(stringLiteral value: StringLiteralType) {
//        self.init(name: value)
//    }
//}
