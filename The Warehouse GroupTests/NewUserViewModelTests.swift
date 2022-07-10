//
//  NewUserViewModelTests.swift
//  The Warehouse GroupTests
//
//  Created by Tharaka Dushmantha on 9/07/22.
//

import XCTest
@testable import The_Warehouse_Group

class MockDataNewUser: FetchNewUserService {
    func fetchNewUser() async throws -> NewUserModel {
        return NewUserModel.mockData
    }
}

class ErrorMockDataNewUser: FetchNewUserService {
    func fetchNewUser() async throws -> NewUserModel {
        throw URLError(.badServerResponse)
    }
}

class NewUserViewModelTests: XCTestCase {
    var viewModel: ContentView.NewUserViewModelImplementation!
    var errorViewModel : ContentView.NewUserViewModelImplementation!
    
    @MainActor  override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = ContentView.NewUserViewModelImplementation(fetchNewUserService: MockDataNewUser())

        errorViewModel = ContentView.NewUserViewModelImplementation(fetchNewUserService: ErrorMockDataNewUser())
    }

    @MainActor  override func tearDownWithError() throws {
        viewModel = nil
        errorViewModel = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    @MainActor  func testUser() async throws {
        await viewModel.fetchNewUser()
        XCTAssertEqual(viewModel.userID, "FC8BFB51-F5E5-4E57-ADC6-48CB0CF38906")
    }
    
    @MainActor  func testErrorUser() async throws {
        await errorViewModel.fetchNewUser()
        XCTAssertTrue(errorViewModel.error != nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
