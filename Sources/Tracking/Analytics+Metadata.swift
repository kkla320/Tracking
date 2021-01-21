//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 13.01.21.
//

import Foundation


extension Analytics {
    public typealias Metadata = [String: Analytics.MetadataValue]
}

extension Analytics {
    /**
     Values that can be passed for metadata
     */
    public enum MetadataValue {
        case `nil`
        case float(Float)
        case int(Int)
        case bool(Bool)
        case string(String)
        case array([Analytics.MetadataValue])
        case dictionary([String: Analytics.MetadataValue])
    }
}

extension Analytics.MetadataValue: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    
    public init(stringLiteral value: StringLiteralType) {
        self = .string(value)
    }
}

extension Analytics.MetadataValue: ExpressibleByStringInterpolation { }

extension Analytics.MetadataValue: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = Analytics.MetadataValue

    public init(arrayLiteral elements: Analytics.MetadataValue...) {
        self = .array(elements)
    }
}

extension Analytics.MetadataValue: ExpressibleByDictionaryLiteral {
    public typealias Key = String
    public typealias Value = Analytics.MetadataValue

    public init(dictionaryLiteral elements: (String, Analytics.MetadataValue)...) {
        self = .dictionary(.init(uniqueKeysWithValues: elements))
    }
}

extension Analytics.MetadataValue: ExpressibleByBooleanLiteral {
    public typealias BooleanLiteralType = Bool
    
    public init(booleanLiteral value: BooleanLiteralType) {
        self = .bool(value)
    }
}

extension Analytics.MetadataValue: ExpressibleByNilLiteral {
    public init(nilLiteral: ()) {
        self = .nil
    }
}

extension Analytics.MetadataValue: ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = Int
    
    public init(integerLiteral value: IntegerLiteralType) {
        self = .int(value)
    }
}

extension Analytics.MetadataValue: ExpressibleByFloatLiteral {
    public typealias FloatLiteralType = Float
    
    public init(floatLiteral value: Float) {
        self = .float(value)
    }
}

extension Analytics.MetadataValue: Equatable {
    
}

extension Analytics.MetadataValue: CustomStringConvertible {
    public var description: String {
        switch self {
        case .float(let float):
            return float.description
        case .int(let int):
            return int.description
        case .nil:
            return "nil"
        case .bool(let bool):
            return bool.description
        case .string(let string):
            return string.description
        case .array(let array):
            return array.map({ $0.description }).description
        case .dictionary(let dictionary):
            return dictionary.map({ "\($0.key): \($0.value.description)" }).description
        }
    }
}
