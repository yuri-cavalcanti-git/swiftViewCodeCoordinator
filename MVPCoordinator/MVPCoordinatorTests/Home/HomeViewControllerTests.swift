import UIKit
import Quick
import Nimble

@testable import MVPCoordinator

final class HomeViewControllerTests: QuickSpec {
    override func spec() {
        var sut: HomeViewController!
        var view: HomeViewSpy!
        var presenter: HomePresenterSpy!
        var delegate: HomeViewControllerDelegateSpy!

        beforeEach {
            view = HomeViewSpy()
            presenter = HomePresenterSpy()
            delegate = HomeViewControllerDelegateSpy()
            sut = HomeViewController(contentView: view,
                                     presenter: presenter)
            sut.delegate = delegate
            _ = sut.view
        }

        describe("#loadView") {
            it("has contentView as controller view") {
                expect(sut.view) == view
            }
        }
        
        describe("#viewDidLoad") {
            it("calls presenter's to load information") {
                expect(presenter.loadCount) == 1
            }
        }
        
        describe("#viewWillAppear") {
            var navigation: UINavigationControllerMock!
            
            beforeEach {
                navigation = UINavigationControllerMock(rootViewController: sut)
                sut.viewWillAppear(false)
            }

            it("setups navigation bar correctly") {
                expect(navigation.title) == "Home"
                expect(navigation.navigationBar.tintColor) == .cyan
            }
        }
        
        describe("show") {
            beforeEach {
                sut.show(text: "Hello")
            }
            
            it("calls view`s show"){
                expect(view.showParam) == ["Hello"]
            }
        }
        
        describe("settingsButton") {
            beforeEach {
                sut.viewWillAppear(false)
                let barButtonItem = sut.navigationItem.rightBarButtonItem!
                _ = barButtonItem.target?.perform(barButtonItem.action)
            }

            it("calls delegate`s openSettings") {
                expect(delegate.openSettingsCount) == 1
            }
        }
    }
}
