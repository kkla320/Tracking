import XCTest
@testable import Tracking

final class AnalyticsTests: XCTestCase {
    var mockHandler: MockAnalyticsHandler!
    var mockFilter: MockAnalyticsFilter!
    var analytics: Analytics!
    
    override func setUp() {
        mockHandler = MockAnalyticsHandler()
        mockFilter = MockAnalyticsFilter()
        mockFilter.shouldSendBehaviour = { _,_ in
            return true
        }
        analytics = Analytics(handlers: [mockHandler], filters: [mockFilter])
    }
    
    func test_log_shouldDelegateToTheLogHandler() {
        analytics.log(event: .mock())
        
        XCTAssertEqual(1, mockHandler.logEventCalls.count)
    }
    
    func test_log_shouldNotDelegateToLogHandler_IfFilterReturnsFalse() {
        mockFilter.shouldSendBehaviour = { _, _ in
            return false
        }
        
        analytics.log(event: .mock())
        
        XCTAssertEqual(0, mockHandler.logEventCalls.count)
    }
    
    func test_log_shouldNotDelegateToLogHandler_IfOneFilterReturnsFalse() {
        let secondMockFilter = MockAnalyticsFilter()
        secondMockFilter.shouldSendBehaviour = { _, _ in
            return true
        }
        mockFilter.shouldSendBehaviour = { _, _ in
            return false
        }
        
        let analytics = Analytics(handlers: [mockHandler], filters: [mockFilter, secondMockFilter])
        
        analytics.log(event: .mock())
        
        XCTAssertEqual(0, mockHandler.logEventCalls.count)
    }
}


