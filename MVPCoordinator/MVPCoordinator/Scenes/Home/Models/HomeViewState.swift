import Foundation
enum HomeViewState {
    case loading
    case error(error: String)
    case ready(viewmodel: HomeReadyViewModel)
}

extension HomeViewState: Equatable {
    static func == (lhs: HomeViewState, rhs: HomeViewState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.error, .error):
            return true
            
        case (.ready, .ready):
            return true
            
        default:
            return false
        }
    }
}
