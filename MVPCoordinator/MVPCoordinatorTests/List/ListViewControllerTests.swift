import UIKit
import Quick
import Nimble

@testable import MVPCoordinator

final class ListViewControllerTests: QuickSpec {
    override func spec() {
        var sut: ListViewController!
        var view: ListViewSpy!
        var presenter: ListPresenterSpy!
        var delegate: ListViewControllerDelegateSpy!

        beforeEach {
            view = ListViewSpy()
            presenter = ListPresenterSpy()
            delegate = ListViewControllerDelegateSpy()
            sut = ListViewController(contentView: view,
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
        
        
        describe("#show") {
            beforeEach {
                sut.show(list: ["swift"])
            }
            
            it("calls view`s show"){
                expect(view.showListParams) == [["swift"]]
            }
        }
        
        describe("bindLayoutEvents") {
            beforeEach {
                view.didTapLanguage?("swift")
            }

            it("calls delegate`s presentListView") {
                expect(delegate.updateTextParam) == ["swift"]
            }
        }
    }
}
