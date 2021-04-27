/// Analytics filter provide a common API for filtering some events.
public protocol AnalyticsFilter {
    /// This method is used to filter an event.
    /// - Parameters:
    ///    - name: The name of the event
    ///    - targetHandler: The handler that should handle the tracking event
    ///    - parameter: The metadata for the event to log
    func shouldSend(_ name: String, targetHandler: AnalyticsHandler, parameter: Analytics.Metadata?) -> Bool
}
