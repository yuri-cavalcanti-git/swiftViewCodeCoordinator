import UIKit
import Quick
import Nimble
import Nimble_Snapshots

@testable import MVPCoordinator

final class HomeHeaderViewTests: QuickSpec {
    override func spec() {
        var sut: HomeHeaderView!

        beforeEach {
            sut = HomeHeaderView()
            sut.frame = UIScreen.main.bounds
        }

        describe("#init") {
            it("has a valid snapshot") {
                expect(sut).to(haveValidSnapshot())
            }
        }
    }
}

