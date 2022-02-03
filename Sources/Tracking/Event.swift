import Foundation

/// An event to track what should be analysed.
public protocol Event {
    /// The name of the event
    var name: String { get }
    
    /// The metadata, associated with the event
    var metadata: Analytics.Metadata? { get }
}
