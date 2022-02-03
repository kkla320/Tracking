/// Analytics filter provide a common API for filtering some events.
public protocol AnalyticsFilter {
    /// This method is used to filter an event.
    /// - Parameters:
    ///    - event: The event which will be send
    ///    - targetHandler: The handler that should handle the tracking event
    func shouldSend(event: Event, targetHandler: AnalyticsHandler) -> Bool
}
