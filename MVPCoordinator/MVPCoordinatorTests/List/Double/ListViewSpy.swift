import UIKit

@testable import MVPCoordinator

final class ListViewSpy: UIView, ListViewType {
    var didTapLanguage: ((String) -> Void)?
    
    private(set) var showListParams = [[String]]()
    func show(list: [String]) {
        showListParams.append(list)
    }
}
