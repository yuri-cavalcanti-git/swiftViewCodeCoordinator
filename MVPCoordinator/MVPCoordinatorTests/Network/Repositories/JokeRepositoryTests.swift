import Quick
import Nimble

@testable import MVPCoordinator

final class JokeRepositoryTests: QuickSpec {
    override func spec() {
        var httpMock: NetworkProtocolMock!
        var sut: JokeRepository!
        
        beforeEach {
            httpMock = NetworkProtocolMock()
            sut = JokeRepository(http: httpMock)
        }
        
        describe("#getJoke") {
            var expectedResult: JokesResponse?
            
            beforeEach {
                httpMock.result = .success(JokesResponse.stubData())
                sut.getJoke { result in
                    if case .success(let object) = result {
                        expectedResult = object
                    }
                }
                
                it("calls request") {
                    expect(httpMock.requestWasCalled) == true
                }
            }
        }
    }
}
