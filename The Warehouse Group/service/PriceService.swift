//
//  PriceService.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 6/07/22.
//

import Foundation

protocol FetchPriceService {
    func fetchPrice(queryParam : String) async throws ->PriceModel
}

struct FetchPriceServiceImplementation : FetchPriceService {
    let router  = Router()
    
    /*
     Mathod : fetching price
     Params : nil
     return : Data decode from price data response
     */
    func fetchPrice(queryParam : String) async throws -> PriceModel {
        guard let decodedResponse = try? await JSONDecoder().decode(PriceModel.self, from: router.fetch(endPoint: .price, queryParam: queryParam))
        else { throw ServiceError.decoderError() }
        return decodedResponse
    }
}

