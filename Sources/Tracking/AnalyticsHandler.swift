/// Analytics handler provide a common API for some analytics of tracking provider.
public protocol AnalyticsHandler {
    /// This method is used to log an event with some parameters.
    /// - Parameters:
    ///    - name: The name of the event
    ///    - parameter: The metadata for the event to log
    func logEvent(_ name: String, parameter: Analytics.Metadata?)
}
