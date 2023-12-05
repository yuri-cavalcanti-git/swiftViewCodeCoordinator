import Quick
import Nimble

@testable import MVPCoordinator

final class GetJokesServiceTests: QuickSpec {
    override func spec() {
        var sut: GetJokesService!
        
        beforeEach {
            sut = GetJokesService()
        }
        
        describe("#init") {
            it("has the correct configuration") {
                expect(sut.path) == "/random_joke"
                expect(sut.httpMethod) == .get
                expect(sut.headers).to(beNil())
                expect(sut.body).to(beNil())
            }
        }
    }
}
