import UIKit
import Quick
import Nimble
import Nimble_Snapshots

@testable import MVPCoordinator

final class HomeViewTets: QuickSpec {
    override func spec() {
        var sut: HomeView!

        beforeEach {
            sut = HomeView(frame: CGRect(x: 0, y: 0, width: 320, height: 400))
        }

        describe("show") {
            beforeEach {
                sut.show(text: "Hello")
            }
            it("has a valid snapshot") {
                expect(sut).to(haveValidSnapshot())
            }
        }
    }
}
