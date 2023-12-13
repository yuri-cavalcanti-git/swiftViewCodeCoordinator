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
    }
}
