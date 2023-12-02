import UIKit
import Quick
import Nimble
import Nimble_Snapshots

@testable import MVPCoordinator

final class SettingsViewTests: QuickSpec {
    override func spec() {
        var sut: SettingsView!

        beforeEach {
            sut = SettingsView()
            sut.frame = UIScreen.main.bounds
        }

        describe("#show") {
            beforeEach {
                sut.show()
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
