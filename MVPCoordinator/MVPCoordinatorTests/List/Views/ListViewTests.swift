import UIKit
import Quick
import Nimble
import Nimble_Snapshots

@testable import MVPCoordinator

final class ListViewTests: QuickSpec {
    override func spec() {
        var sut: ListView!

        beforeEach {
            sut = ListView()
            sut.frame = UIScreen.main.bounds
        }

        describe("#show") {
            beforeEach {
                sut.show(list: ["swift", "kotlin", "java", "c#"])
            }
            it("has a valid snapshot") {
                expect(sut).to(haveValidSnapshot())
            }
        }
        
        describe("didTapLanguage") {
            var table: UITableView?
            var didTapdataSourceParam = [String]()

            beforeEach {
                sut.didTapLanguage = { language in
                    didTapdataSourceParam.append(language)
                }
                table = Mirror.extract(named: "tableView", from: sut)
                let section = table?.delegate as? ListDataSourceDelegate
                section?.didTapLanguage?("swift")
            }

            it("binds correctly") {
                expect(didTapdataSourceParam) == ["swift"]
            }
        }
    }
}
