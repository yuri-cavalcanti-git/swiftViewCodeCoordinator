//
//  HomeReadyViewTests.swift
//  MVPCoordinatorTests
//
//  Created by Yuri Cavalcanti on 07/12/23.
//
import UIKit
import Quick
import Nimble
import Nimble_Snapshots

@testable import MVPCoordinator

final class HomeReadyViewTests: QuickSpec {
    override func spec() {
        var sut: HomeReadyView!

        beforeEach {
            sut = HomeReadyView()
            sut.frame = UIScreen.main.bounds
        }

        describe("#show") {
            beforeEach {
                sut.show(viewModel: .stub())
            }
            
            it("has a valid snapshot") {
                expect(sut).to(haveValidSnapshot())
            }
        }
    }
}
