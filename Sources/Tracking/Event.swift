import Foundation

/// An event to track what should be analysed.
public protocol Event {
    /// The name of the event
    var name: String { get }
    
    /// Default metadata that will be send. It will be overridden if the parameters parameter defines the same metadata
    var metadata: Analytics.Metadata? { get }
}
