//
//  PriceViewModelTests.swift
//  The Warehouse GroupTests
//
//  Created by Tharaka Dushmantha on 10/07/22.
//

import XCTest
@testable import The_Warehouse_Group

class MockDataPrice: FetchPriceService {
    func fetchPrice(queryParam: String) async throws -> PriceModel {
        PriceModel.mockData
    }

}

class ErrorMockDataPrice: FetchPriceService {
    func fetchPrice(queryParam: String) async throws -> PriceModel {
        throw URLError(.badServerResponse)
    }
}
class PriceViewModelTests: XCTestCase {
    var viewModel: ProductView.PriceViewModelImplementation!
    var errorViewModel : ProductView.PriceViewModelImplementation!
    
    @MainActor override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = ProductView.PriceViewModelImplementation(fetchPriceService: MockDataPrice())
        errorViewModel = ProductView.PriceViewModelImplementation(fetchPriceService: ErrorMockDataPrice())
    }

    @MainActor override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        errorViewModel = nil
    }

    @MainActor  func testSearchResult() async throws {
        await viewModel.fetchPrice(barcode: "9400032284477")
        XCTAssertEqual(viewModel.price?.found, "Y")
        XCTAssertTrue(viewModel.price?.product != nil )
    }
    
    @MainActor  func testErrorUser() async throws {
        await errorViewModel.fetchPrice(barcode: "9400032284477")
        XCTAssertTrue(errorViewModel.error != nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
