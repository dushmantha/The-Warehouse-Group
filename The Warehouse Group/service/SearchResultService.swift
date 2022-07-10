//
//  SearchResultService.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 6/07/22.
//

import Foundation

protocol FetchSearchResultService {
    func fetchSearchResult(queryParam: String) async throws ->SearchResultModel
}

struct FetchSearchResultServiceImplementation : FetchSearchResultService {
    let router  = Router()
    
    /*
     Mathod : fetching search result
     Params : nil
     return : Data decode from search result data response
     */
    func fetchSearchResult(queryParam : String) async throws -> SearchResultModel {
        guard let decodedResponse = try? await JSONDecoder().decode(SearchResultModel.self, from: router.fetch(endPoint: .search, queryParam: queryParam))
        else { throw ServiceError.decoderError() }
        return decodedResponse
    }
}
