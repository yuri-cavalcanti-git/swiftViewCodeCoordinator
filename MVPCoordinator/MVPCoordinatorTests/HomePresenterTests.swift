import Quick
import Nimble

@testable import MVPCoordinator

final class HomePresenterTests: QuickSpec {
    override func spec() {
        var sut: HomePresenter!
        var controller: HomeViewControllerSpy!
        
        beforeEach {
            controller = HomeViewControllerSpy()
            sut = HomePresenter(text: "Hello")
            
            sut.controller = controller
        }
        
        describe("load") {
            beforeEach {
                sut.load()
            }
            
            it("calls controller`s show") {
               expect(controller.textParam) == ["Hello"]
            }
        }
    }
}
