/// A simple struct for sending events with optional metadata to all provided AnalyticsHandler.
/// - Tag: Analytics
public struct Analytics {
    public let handlers: [AnalyticsHandler]
    public let filters: [AnalyticsFilter]
    
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
    public func log<E: Event>(event: E) {
        for handler in handlers {
            let shouldSend = filters
                .map { $0.shouldSend(event: event, targetHandler: handler) }
                .reduce(true) { $0 && $1 }
            guard shouldSend else {
                continue
            }
            handler.log(event: event)
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
