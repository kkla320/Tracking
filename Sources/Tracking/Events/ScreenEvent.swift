public struct ScreenEvent: Event {
    public var name: String
    
    public var defaultMetadata: Analytics.Metadata?
    
    public init<T>(screenName: String, sender: T) {
        self.name = "screen-appeared"
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
