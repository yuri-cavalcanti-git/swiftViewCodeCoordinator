import UIKit
import Quick
import Nimble
import Nimble_Snapshots

@testable import MVPCoordinator

final class HomeViewTests: QuickSpec {
    override func spec() {
        var sut: HomeView!

        beforeEach {
            sut = HomeView(frame: CGRect(x: 0, y: 0, width: 320, height: 400))
        }

        describe("show") {
            beforeEach {
                sut.show(state: .ready(viewmodel: .stub()))
            }
            it("has a valid snapshot") {
                expect(sut).to(haveValidSnapshot())
            }
        }
        
        describe("#bindLayoutEvents") {
            var button: UIButton?
            var didTapButtonCount = 0
            
            beforeEach {
                sut.didTapButton = {
                    didTapButtonCount += 1
                }
                button = Mirror.extract(named: "button", from: sut)
                button?.sendActions(for: .touchUpInside)
            }
            
            it("binds correctly") {
                expect(didTapButtonCount) == 1
            }
        }
    }
}
