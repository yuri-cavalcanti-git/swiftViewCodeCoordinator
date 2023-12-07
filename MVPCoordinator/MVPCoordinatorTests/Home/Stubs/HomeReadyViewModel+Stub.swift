import Foundation
import Quick
import Nimble

@testable import MVPCoordinator

extension HomeReadyViewModel {
    static func stub(setup: String = "What's the best thing about elevator jokes?",
                     punchline: String = "They work on so many levels.") -> HomeReadyViewModel {
        HomeReadyViewModel(setup: setup,
                           punchline: punchline)
    }
}
