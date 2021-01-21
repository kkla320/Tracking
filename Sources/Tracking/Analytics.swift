/**
 A simple struct for sending events with optional metadata to all provided AnalyticsHandler.
 - Tag: Analytics
 */
public struct Analytics {
    var handlers: [AnalyticsHandler]
    
    /**
    Initializes analytics with the provided AnalyticsHandlers
     - Parameters:
        - handlers: An array of handlers that events will be passed to
     */
    public init(handlers: [AnalyticsHandler]) {
        self.handlers = handlers
    }
    
    /**
    Sends an event to the handlers
     - Parameters:
        - event: An instance of an event to identify the current
        - parameters: Additional metadata that can be provided
     */
    public func log(event: Event, parameters: Metadata? = nil) {
        for handler in handlers {
            handler.logEvent(event.name, parameter: parameters + event.defaultMetadata)
        }
    }
}

func + (lhs: Analytics.Metadata?, rhs: Analytics.Metadata?) -> Analytics.Metadata? {
    switch (lhs, rhs) {
    case (.none, .none):
        return nil
    case (.none, .some(let rhs)):
        return rhs
    case (.some(let lhs), .none):
        return lhs
    case (.some(let lhs), .some(let rhs)):
        return lhs.reduce(into: rhs) { $0[$1.key] = $1.value }
    }
}
