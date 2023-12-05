//
//  JokesResponse+Stub.swift
//  MVPCoordinatorTests
//
//  Created by Yuri Cavalcanti on 05/12/23.
//

import Foundation
import Quick
import Nimble

@testable import MVPCoordinator

extension JokesResponse {
    static func stub(type: String = "general",
                     setup: String = "What's the best thing about elevator jokes?",
                     punchline: String = "They work on so many levels.",
                     id: Int = 272) -> JokesResponse {
        JokesResponse(type: type,
                      setup: setup,
                      punchline: punchline,
                      id: id)
    }
    
    static func stubData() -> Data {
        let resultJason = """
            {
            "type": "general",
            "setup": "Why do mathematicians hate the U.S.?",
            "punchline": "Because it's indivisible.",
            "id": 354
            }

        """
        return resultJason.data(using: .utf8)!
    }
}
