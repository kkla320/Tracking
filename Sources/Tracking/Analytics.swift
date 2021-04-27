/// A simple struct for sending events with optional metadata to all provided AnalyticsHandler.
/// - Tag: Analytics
public struct Analytics {
    public private(set) var handlers: [AnalyticsHandler]
    public private(set) var filters: [AnalyticsFilter]
    
    /// Initializes analytics with the provided AnalyticsHandlers
    /// - Parameters:
    ///    - handlers: An array of handlers that events will be passed to
    public init(handlers: [AnalyticsHandler]) {
        self.handlers = handlers
        self.filters = []
    }
    
    /// Initializes analytics with the provided AnalyticsHandlers
    /// - Parameters:
    ///    - handlers: An array of handlers that events will be passed to
    ///    - filters: An array of filters that will be used to filter events
    public init(handlers: [AnalyticsHandler], filters: [AnalyticsFilter]) {
        self.handlers = handlers
        self.filters = filters
    }
    
    /// Sends an event to the handlers
    /// - Parameters:
    ///    - event: An instance of an event to identify the current
    ///    - parameters: Additional metadata that can be provided
    public func log<E>(event: E, parameters: Metadata? = nil) where E: Event {
        for handler in handlers {
            let allParameters = parameters + event.defaultMetadata
            let shouldSend = filters
                .map { $0.shouldSend(E.name, targetHandler: handler, parameter: allParameters) }
                .reduce(true) { $0 && $1 }
            guard shouldSend else {
                continue
            }
            handler.logEvent(E.name, parameter: allParameters)
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
