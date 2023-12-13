import UIKit
import Quick
import Nimble
import Nimble_Snapshots

@testable import MVPCoordinator

final class ListCellViewTests: QuickSpec {
    override func spec() {
        var sut: ListCellView!

        beforeEach {
            sut = ListCellView(frame: CGRect(x: 0, y: 0, width: 320, height: 30))
            sut.backgroundColor = .white
        }

        describe("#show") {
            beforeEach {
                sut.show(languageName: "swift")
            }

            it("has a valid snapshot") {
                expect(sut).to(haveValidSnapshot())
            }
        }
    }
}
