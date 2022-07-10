//
//  SearchResultModelTests.swift
//  The Warehouse GroupTests
//
//  Created by Tharaka Dushmantha on 10/07/22.
//

import XCTest
@testable import The_Warehouse_Group

class MockDataSearchResult: FetchSearchResultService {
    func fetchSearchResult(queryParam: String) async throws -> SearchResultModel {
        SearchResultModel.mockData
    }
    
}

class ErrorMockDataSearchResult: FetchSearchResultService {
    func fetchSearchResult(queryParam: String) async throws -> SearchResultModel {
        throw URLError(.badServerResponse)
    }
}

class SearchResultModelTests: XCTestCase {
    var viewModel: ProductListView.SearchResultViewModelImplementation!
    var errorViewModel : ProductListView.SearchResultViewModelImplementation!
    
    @MainActor override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = ProductListView.SearchResultViewModelImplementation(fetchSearchResultService: MockDataSearchResult())
        errorViewModel = ProductListView.SearchResultViewModelImplementation(fetchSearchResultService: ErrorMockDataSearchResult())
    }

    @MainActor override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        errorViewModel = nil
    }

    @MainActor  func testSearchResult() async throws {
        await viewModel.fetchSearchResult(search: "A", isLoadMore: true)
        XCTAssertEqual(viewModel.products.count, 2)
        XCTAssertEqual(viewModel.startIndex, 21)
    }
    
    @MainActor  func testSearchResultEmpty() async throws {
        await viewModel.fetchSearchResult(search: "", isLoadMore: false)
        XCTAssertEqual(viewModel.products.count, 0)
        XCTAssertEqual(viewModel.startIndex, 0)
    }
    
    @MainActor  func testErrorUser() async throws {
        await errorViewModel.fetchSearchResult(search: "A", isLoadMore: false)
        XCTAssertTrue(errorViewModel.error != nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
