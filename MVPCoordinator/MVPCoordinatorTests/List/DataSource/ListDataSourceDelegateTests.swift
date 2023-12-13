import UIKit
import Quick
import Nimble
import Nimble_Snapshots

@testable import MVPCoordinator

final class ListDataSourceDelegateTests: QuickSpec {
    override func spec() {
        var sut: ListDataSourceDelegate!
        var tableView: UITableView!
        
        beforeEach {
            sut = ListDataSourceDelegate()
            
            tableView = UITableView()
            tableView.register(ListCell.self)
            tableView.dataSource = sut
            tableView.delegate = sut
            tableView.reloadData()
        }
        
        describe("#numberOfRowsInSection") {
            beforeEach {
                sut.update(list: ["swift", "kotlin"])
            }
            
            it("return correct number of rows") {
                let rows = sut.tableView(tableView, numberOfRowsInSection: 0)
                expect(rows) == 2
            }
        }
        
        describe("#cellForRowAt") {
            beforeEach {
                sut.update(list: ["swift", "kotlin"])
            }
            
            it("return correct cell") {
                let cell = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
                expect(cell).to(beAKindOf(ListCell.self))
            }
        }
        
        describe("#didSelectRowAt") {
            var didTapLanguageParam = [String]()
            
            beforeEach {
                sut.update(list: ["swift", "kotlin"])
                
                sut.didTapLanguage = { language in
                    didTapLanguageParam.append(language)
                }
                sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
            }
            
            it("return correct language") {
                expect(didTapLanguageParam) == ["swift"]
            }
        }
    }
}

