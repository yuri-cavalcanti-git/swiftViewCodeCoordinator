import Quick
import Nimble

@testable import MVPCoordinator

final class HomePresenterTests: QuickSpec {
    override func spec() {
        var sut: HomePresenter!
        var controller: HomeViewControllerSpy!
        var repository: JokeRepositoryMock!

        beforeEach {
            controller = HomeViewControllerSpy()
            repository = JokeRepositoryMock()
            sut = HomePresenter(repository: repository)

            sut.controller = controller
        }

        describe("load") {
            context("when request succeeds") {
                beforeEach {
                    repository.getJokeResult = .success(.stub())
                    sut.load()
                }

                it("calls controller`s show") {
                   //Todo
                }
            }

            context("when request fails") {
                beforeEach {
                    repository.getJokeResult = .failure(.general)
                    sut.load()
                }

                it("calls controller`s show") {
                   //Todo
                }
            }
        }
    }
}
