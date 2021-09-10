/// Analytics handler provide a common API for some analytics of tracking provider.
public protocol AnalyticsHandler {
    /// This method is used to log an event with some parameters.
    /// - Parameters:
    ///    - event: The event to log
    func log(event: Event)
}
