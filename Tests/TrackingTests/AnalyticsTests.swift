import XCTest
@testable import Tracking

final class AnalyticsTests: XCTestCase {
    var mockHandler: MockAnalyticsHandler!
    var analytics: Analytics!
    
    override func setUp() {
        mockHandler = MockAnalyticsHandler()
        analytics = Analytics(handlers: [mockHandler])
    }
    
    func test_log_ShouldAddDefaultParameters() {
        analytics.log(event: Events.mock)
        
        XCTAssertEqual(1, mockHandler.logEventCalls.count)
        let metadata: Analytics.Metadata? = mockHandler.logEventCalls.get(argument: "parameter", for: 0)
        XCTAssertEqual(true, metadata?["isMock"])
    }
    
    func test_log_ShouldOverrideDefaultParameters() {
        analytics.log(event: Events.mock, parameters: [
            "isMock": false
        ])
        
        XCTAssertEqual(1, mockHandler.logEventCalls.count)
        let parameter: Analytics.Metadata? = mockHandler.logEventCalls.get(argument: "parameter", for: 0)
        XCTAssertEqual(false, parameter?["isMock"])
    }

    static var allTests = [
        ("test_log_ShouldAddDefaultParameters", test_log_ShouldAddDefaultParameters),
        ("test_log_ShouldOverrideDefaultParameters", test_log_ShouldOverrideDefaultParameters),
    ]
}

struct Call {
    private var arguments: [String: Any]
    
    init(arguments: [String: Any]) {
        self.arguments = arguments
    }
    
    func get<T>(argument: String) -> T? {
        return arguments[argument] as? T
    }
}

class MockAnalyticsHandler: AnalyticsHandler {
    var logEventCalls: [Call]
    
    init() {
        logEventCalls = []
    }
    
    func logEvent(_ name: String, parameter: Analytics.Metadata?) {
        logEventCalls.append(Call(arguments: [
            "name": name,
            "parameter": parameter ?? [:]
        ]))
    }
}

extension Events {
    static var mock: Event {
        return MockEvent(name: "Mock", defaultMetadata: [
            "isMock": true
        ])
    }
}

struct MockEvent: Event {
    var name: String
    
    var defaultMetadata: Analytics.Metadata?
    
    init(name: String, defaultMetadata: Analytics.Metadata? = nil) {
        self.name = name
        self.defaultMetadata = defaultMetadata
    }
}

extension Array where Element == Call {
    func get<T>(argument: String, for call: Int) -> T? {
        let call = self[call]
        return call.get(argument: argument)
    }
}
