import Foundation
import UIKit

final class ListDataSourceDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    var didTapLanguage: ((String) -> Void)?
    private var list: [String] = []
    
    func registerCell(in tableView: UITableView) {
        tableView.register(ListCell.self)
    }
    
    func update(list: [String]) {
        self.list = list
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListCell = tableView.dequeueReusableCell(for: indexPath)
        cell.show(languageName: list[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let language = list[indexPath.row]
        didTapLanguage?(language)
    }
}
