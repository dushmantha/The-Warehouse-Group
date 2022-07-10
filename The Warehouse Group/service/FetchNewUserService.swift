//
//  FetchNewUserService.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 6/07/22.
//

import Foundation

protocol FetchNewUserService {
    func fetchNewUser() async throws ->NewUserModel
}

struct FetchNewUserServiceImplementation : FetchNewUserService {
    let router  = Router()
    
    /*
     Mathod : fetching new user
     Params : nil
     return : Data decode from new user data response
     */
    func fetchNewUser() async throws -> NewUserModel {
        guard let decodedResponse = try? await JSONDecoder().decode(NewUserModel.self, from: router.fetch(endPoint: .newUser, queryParam: nil))
        else { throw ServiceError.decoderError() }
        return decodedResponse
    }
}
