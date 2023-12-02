import UIKit
import Quick
import Nimble

@testable import MVPCoordinator

final class SettingsViewControllerTests: QuickSpec {
    override func spec() {
        var sut: SettingsViewController!
        var view: SettingsViewSpy!
        var presenter: SettingsPresenterSpy!
        var delegate: SettingsViewControllerDelegateSpy!

        beforeEach {
            view = SettingsViewSpy()
            presenter = SettingsPresenterSpy()
            delegate = SettingsViewControllerDelegateSpy()
            sut = SettingsViewController(contentView: view,
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
                expect(navigation.title) == "MVPCoordinator"
                expect(navigation.navigationBar.tintColor) == .cyan
            }
        }
        
        describe("show") {
            beforeEach {
                sut.show()
            }
            
            it("calls view`s show"){
                expect(view.showCount) == 1
            }
        }
    }
}
