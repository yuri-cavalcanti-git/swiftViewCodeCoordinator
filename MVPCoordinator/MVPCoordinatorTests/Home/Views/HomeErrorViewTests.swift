import UIKit
import Quick
import Nimble
import Nimble_Snapshots

@testable import MVPCoordinator

final class HomeErrorViewTests: QuickSpec {
    override func spec() {
        var sut: HomeErrorView!

        beforeEach {
            sut = HomeErrorView()
            sut.frame = UIScreen.main.bounds
        }

        describe("#show") {
            beforeEach {
                sut.show(error: "ERROR")
            }
            
            it("has a valid snapshot") {
                expect(sut).to(haveValidSnapshot())
            }
        }
    }
}
