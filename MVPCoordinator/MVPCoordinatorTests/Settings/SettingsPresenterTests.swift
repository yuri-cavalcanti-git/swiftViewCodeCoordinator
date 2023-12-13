import Quick
import Nimble

@testable import MVPCoordinator

final class SettingsPresenterTests: QuickSpec {
    override func spec() {
        var sut: SettingsPresenter!
        var controller: SettingsViewControllerSpy!
        
        beforeEach {
            controller = SettingsViewControllerSpy()
            sut = SettingsPresenter()
            
            sut.controller = controller
        }
        
        describe("load") {
            beforeEach {
                sut.load()
            }
            
            it("calls controller`s show") {
                expect(controller.showParam) == [nil]
            }
        }
    }
}
