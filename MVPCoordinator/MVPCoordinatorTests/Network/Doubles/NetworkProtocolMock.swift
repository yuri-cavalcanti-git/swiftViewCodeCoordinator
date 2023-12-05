import Foundation

@testable import MVPCoordinator

final class NetworkProtocolMock: NetworkProtocol {
    private(set) var requestWasCalled = false
    var result: (Result<Data, ApiError>)?
    
    func request<T>(service: ServiceProtocol, completion: @escaping (Result<T, ApiError>) -> Void) where T : Decodable, T : Encodable {
        requestWasCalled = true
    }
    
    func request (service: ServiceProtocol, completion: @escaping (Result<Data, ApiError>) -> Void) {
        requestWasCalled = true
        if let result = self.result {
            completion(result)
        }
    }
}
