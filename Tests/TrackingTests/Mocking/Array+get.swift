//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 10.09.21.
//

import Foundation

extension Array where Element == Call {
    /// Gets a specific argument from a call, identified by the index
    /// - Parameters:
    ///   - argument: The name of the argument to receive
    ///   - index: The index of the call
    /// - Returns: The value of the argument
    func get<T>(argument: String, at index: Index) -> T? {
        let call = self[index]
        return call.get(argument: argument)
    }
}
