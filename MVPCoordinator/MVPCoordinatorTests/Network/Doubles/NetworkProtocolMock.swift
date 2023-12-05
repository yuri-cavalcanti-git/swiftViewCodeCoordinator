import Foundation

@testable import MVPCoordinator

final class NetworkProtocolMock: NetworkProtocol {
    private(set) var requestWasCalled = false
    var result: (Result<Data, Error>)?
    
    func request<T>(service: ServiceProtocol, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        requestWasCalled = true
    }
    
    func request (service: ServiceProtocol, completion: @escaping (Result<Data, Error>) -> Void) {
        requestWasCalled = true
        if let result = self.result {
            completion(result)
        }
    }
}
