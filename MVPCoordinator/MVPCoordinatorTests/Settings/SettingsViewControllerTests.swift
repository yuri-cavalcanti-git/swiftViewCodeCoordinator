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
                expect(navigation.title) == "Settings"
                expect(navigation.navigationBar.tintColor) == .black
                expect(navigation.navigationBar.barTintColor) == .purple
            }
        }
        
        describe("#show") {
            context("when title is nil") {
                beforeEach {
                    sut.show(titleText: nil)
                }
                
                it("calls view`s show"){
                    expect(view.showParam) == [nil]
                }
            }
                
            context("when title is not nil") {
                beforeEach {
                    sut.show(titleText: "Title")
                }
                
                it("calls view`s show"){
                    expect(view.showParam) == ["Title"]
                }
            }
        }
        
        describe("bindLayoutEvents") {
            beforeEach {
                view.didTapButton?()
            }
            
            it("calls delegate`s presentListView") {
                expect(delegate.presentListViewCount) == 1
            }
        }
        
        // MARK: - ListUpdateListener
        describe("#updateTitle") {
            beforeEach {
                sut.updateTitle(language: "swift")
            }
            
            it("calls view`s show") {
                expect(view.showParam) == ["swift"]
            }
        }
    }
}
