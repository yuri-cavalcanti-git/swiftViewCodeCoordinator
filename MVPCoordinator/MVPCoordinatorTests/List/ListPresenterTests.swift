import Quick
import Nimble

@testable import MVPCoordinator

final class ListPresenterTests: QuickSpec {
    override func spec() {
        var sut: ListPresenter!
        var controller: ListViewControllerSpy!
        
        beforeEach {
            controller = ListViewControllerSpy()
            sut = ListPresenter()
            
            sut.controller = controller
        }
        
        describe("load") {
            beforeEach {
                sut.load()
            }
            
            it("calls controller`s show") {
                expect(controller.showListParams) == [["swift", "kotlin", "java", "c#"]]
            }
        }
    }
}
