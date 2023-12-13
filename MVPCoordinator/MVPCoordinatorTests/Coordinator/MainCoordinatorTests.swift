import UIKit
import Quick
import Nimble

@testable import MVPCoordinator

final class MainCoordinatorTests: QuickSpec {
    override func spec() {

        var sut: MainCoordinator!
        var navigationControllerMock: UINavigationControllerMock!
        var viewControllerMock: ViewControllerMock!
        var networkMock: NetworkProtocolMock!

        beforeEach {
            navigationControllerMock = UINavigationControllerMock()
            viewControllerMock = ViewControllerMock()
            networkMock = NetworkProtocolMock()
            sut = MainCoordinator(navigationController: navigationControllerMock,
                                  flow: .firstFlow,
                                  network: networkMock)

            UIView.setAnimationsEnabled(false)
        }

        describe("#start") {
            beforeEach {
                sut.start()
            }

            it("pushes HomeViewController") {
                expect(sut.currentViewController).to(beAKindOf(HomeViewController.self))
                expect(navigationControllerMock.currentPushedViewController).to(beAKindOf(HomeViewController.self))
            }
        }

        describe("#openSettings") {
            beforeEach {
                sut.openSettings()
            }

            it("pushes SettingsViewController") {
                expect(sut.currentViewController).to(beAKindOf(SettingsViewController.self))
                expect(navigationControllerMock.currentPushedViewController).to(beAKindOf(SettingsViewController.self))
            }
        }
        
        describe("#presentListView") {
            beforeEach {
                sut.presentListView()
            }

            it("prensents ListViewController") {
                expect(navigationControllerMock.currentPresentedViewController).to(beAKindOf(ListViewController.self))
            }
        }
        
        describe("#updateText") {
            var listenerSpy1: ListUpdateListenerSpy!
            var listenerSpy2: ListUpdateListenerSpy!
            
            beforeEach {
                listenerSpy1 = ListUpdateListenerSpy()
                listenerSpy2 = ListUpdateListenerSpy()
                navigationControllerMock.viewControllers = [
                    UIViewController(),
                    listenerSpy1,
                    UIViewController(),
                    listenerSpy2,
                    UIViewController()
                ]
                sut.updateText(language: "swift")
            }
            
            it("updates all listener in navigation controller") {
                expect(listenerSpy1.updateTitleParam) == ["swift"]
                expect(listenerSpy2.updateTitleParam) == ["swift"]
            }
            
            it("dismiss controller") {
                expect(navigationControllerMock.dismissCount) == 1
            }
        }
    }
}
