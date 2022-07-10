//
//  NewUserModel.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 6/07/22.
//

import Foundation

struct NewUserModel: Decodable {
    let userID : String?
    let prodQAT : String?
    
    
    enum CodingKeys: String, CodingKey {
        case userID = "UserID"
        case prodQAT = "ProdQAT"
    }
}
/*
 {
 "ProdQAT": "Prod",
 "UserID": "FC8BFB51-F5E5-4E57-ADC6-48CB0CF38906"
}
 */

extension NewUserModel{
    static let mockData: NewUserModel = {
        NewUserModel(userID: "FC8BFB51-F5E5-4E57-ADC6-48CB0CF38906", prodQAT : "Prod")
    }()
}
