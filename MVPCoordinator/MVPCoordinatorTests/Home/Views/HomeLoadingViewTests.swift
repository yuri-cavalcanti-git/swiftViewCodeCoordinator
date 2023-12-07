import UIKit
import Quick
import Nimble
import Nimble_Snapshots

@testable import MVPCoordinator

final class HomeLoadingViewTests: QuickSpec {
    override func spec() {
        var sut: HomeLoadingView!

        beforeEach {
            sut = HomeLoadingView()
            sut.frame = UIScreen.main.bounds
        }

        describe("#init") {
            it("has a valid snapshot") {
                expect(sut).to(haveValidSnapshot())
            }
        }
    }
}
