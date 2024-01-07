import XCTest
@testable import LCLib

final class LCLibTests: XCTestCase {
    
    func testRequest() async throws {
        let sut = TestEndpoint()
        
        let result = try await URLSession.shared.data(for: sut.request!)
        let json = try JSONDecoder().decode(TestResponse.self, from: result.0)
        
        XCTAssert(json.name == "Pierre")
    }
}
