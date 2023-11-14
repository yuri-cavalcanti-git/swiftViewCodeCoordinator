import UIKit
import Quick
import Nimble

@testable import MVPCoordinator

final class MainCoordinatorTests: QuickSpec {
    override func spec() {
        
        var sut: MainCoordinator!
        var navigationControllerMock: UINavigationControllerMock!
        var viewControllerMock: ViewControllerMock!
        
        beforeEach {
            navigationControllerMock = UINavigationControllerMock()
            viewControllerMock = ViewControllerMock()
            sut = MainCoordinator(navigationController: navigationControllerMock,
                                  flow: .firstFlow)
            
            UIView.setAnimationsEnabled(false)
        }
        
        describe("#start") {
            beforeEach {
                sut.start()
            }
            
            it("pushes HomeViewController") {
                expect(sut.currentViewController).to(beAKindOf(HomeViewController.self))
            }
        }
    }
}
