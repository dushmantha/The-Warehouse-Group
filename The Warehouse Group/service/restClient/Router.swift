//
//  Router.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 6/07/22.
//

import Foundation

struct Router {
    
    /*
     Mathod : preparing url request for API call
     Params : endPoint - last path componet of the base url, queryParam - appending params component of url
     return : url request
     */
    
    func asURLRequest(endPoint : RelativePath, queryParam : String?) throws -> URLRequest{
        switch endPoint {
        case .newUser :
            guard let url = URL(string: APIConstants.baseUrl.appending(endPoint.rawValue)) else { throw ServiceError.urlNotFound() }
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            urlRequest.setValue(APIConstants.subKey, forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
            return urlRequest
        case .search, .price:
            guard let url = URL(string: APIConstants.baseUrl.appending(endPoint.rawValue) + queryParam!) else { throw ServiceError.urlNotFound() }
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            urlRequest.setValue(APIConstants.subKey, forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
            return urlRequest
        }
    }
    
    /*
     Mathod : fetching data from API
     Params : endPoint - last path componet of the base url, queryParam - appending params component of url
     return : fetch data
     */
    
    func fetch(endPoint : RelativePath, queryParam : String?) async throws->Data{
        let urlSession = URLSession.shared
        let (data, response) = try await urlSession.data(for: asURLRequest(endPoint: endPoint, queryParam: queryParam))
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {throw ServiceError.statusNotOk("Failed to find data.", statusCode: (response as? HTTPURLResponse)?.statusCode)}
        return data;
    }
}
