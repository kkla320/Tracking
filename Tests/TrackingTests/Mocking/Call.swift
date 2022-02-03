//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 10.09.21.
//

import Foundation

/// A call, that can be accessed while testing
struct Call {
    private var arguments: [String: Any]
    
    init(arguments: [String: Any]) {
        self.arguments = arguments
    }
    
    /// Gets a specific argument
    /// - Parameter argument: The name of the argument
    /// - Returns: Returns the argument or nil, if no argument with the given name was found
    func get<T>(argument: String) -> T? {
        return arguments[argument] as? T
    }
}
