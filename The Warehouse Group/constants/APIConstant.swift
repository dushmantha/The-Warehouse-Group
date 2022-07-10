//
//  APIConstant.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 6/07/22.
//

import Foundation

// API constants
enum APIConstants{
    static let baseUrl = "https://twg.azure-api.net/bolt/"
    static let subKey = "b50bca3f037a40718baa42b9473941b8"
    static let machineID = "208"
}

// API error message
enum ServiceError: Error {
    case urlNotFound(String = "Missing URL")
    case statusNotOk(String = "Failed to find data.", statusCode: Int?)
    case decoderError(String = "Unable to decode data")
}

// API http method
enum HTTPMethod: String{
    case get = "GET"
}

// API last path
enum RelativePath : String{
    case newUser = "newuser.json"
    case search = "search.json?"
    case price = "price.json?"
}
