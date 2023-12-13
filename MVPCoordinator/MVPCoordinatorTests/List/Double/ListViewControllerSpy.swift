import UIKit

@testable import MVPCoordinator

final class ListViewControllerSpy: UIViewController, ListViewControllerType {
    private(set) var showListParams = [[String]]()
    func show(list: [String]) {
        showListParams.append(list)
    }
}
