//
//  ContentViewModelTests.swift
//  SkeletonProjectTests
//
//  Created by Matej Persic on 26.08.2024..
//

@testable import SkeletonProject
import XCTest

final class ContentViewModelTests: XCTestCase {
    
    var viewModel: ContentViewModel!
    var mockNetworkManager: MockNetworkManager!

    override func setUpWithError() throws {
        // Set up resources used in the tests, like mock data and view models
        mockNetworkManager = MockNetworkManager()
        viewModel = ContentViewModel(networkManager: mockNetworkManager)
    }

    override func tearDownWithError() throws {
        // Clean up any resources that were created in setUpWithError()
        viewModel = nil
        mockNetworkManager = nil
    }

    // Example test case
    func testFetchUsersSuccess() async {
        let mockData = """
        [
            { "id": 1, "name": "John Doe" },
            { "id": 2, "name": "Jane Doe" }
        ]
        """.data(using: .utf8)!
        
        mockNetworkManager.mockData = mockData
        
        await viewModel.fetchUsers()
        
        XCTAssertEqual(viewModel.users.count, 2)
        XCTAssertEqual(viewModel.users.first?.name, "John Doe")
    }

    func testFetchUsersFailure() async {

        mockNetworkManager.error = ManagerErrors.invalidResponse
        
        await viewModel.fetchUsers()

        XCTAssertEqual(viewModel.users.count, 0) // Should have no users on failure
    }
}
