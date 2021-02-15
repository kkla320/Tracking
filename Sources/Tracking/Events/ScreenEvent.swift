public struct ScreenEvent: Event {
    public static var name: String = "screen-appeared"
    
    public var defaultMetadata: Analytics.Metadata?
    
    public init<T>(screenName: String, sender: T) {
        self.defaultMetadata = [
            screenNameMetadataKey: .string(screenName),
            screenSenderMetadataKey: .string(String(describing: sender.self))
        ]
    }
}

extension ScreenEvent {
    public var screenNameMetadataKey: String {
        return "screen-name"
    }
    public var screenSenderMetadataKey: String {
        return "screen-sender"
    }
}

extension Events {
    public static func screenEvent<T>(screenName: String, sender: T) -> ScreenEvent {
        return ScreenEvent(screenName: screenName, sender: sender)
    }
}
