//
//  SearchResultModel.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 6/07/22.
//

import Foundation

struct Product: Decodable {
    let barcode: String?
    let description : String?
    let imageUrl : String?
    let productKey : String?
    let price : Price?
    
    enum CodingKeys: String, CodingKey {
        case barcode = "Barcode"
        case productKey = "ProductKey"
        case description  = "Description"
        case imageUrl = "ImageURL"
        case price = "Price"
    }
}

struct ProductResultsModel: Decodable {
    let description  : String?
    let products  : [Product]?
    
    enum CodingKeys: String, CodingKey {
        case description = "Description"
        case products = "Products"
    }
    
}


struct SearchResultModel: Decodable {
    let hitCount  : String
    let results  : [ProductResultsModel]
    
    enum CodingKeys: String, CodingKey {
        case hitCount = "HitCount"
        case results = "Results"
    }
    
}
/*
 {
 "HitCount": "1000",
 "Results": [{
 "Description": "ADD A $ HOSPICE",
 "Products": [{
 
 }]
 }, {
 "Description": "Escape Room in a Box Game A",
 "Products": [{
 "Class0": "Toys",
 "Barcode": "887961963618",
 "ItemDescription": "",
 "DeptID": "06019",
 "SubClass": "Branded Board Games",
 "Class0ID": "09930",
 "SubDeptID": "6219",
 "Description": "Escape Room in a Box Game A",
 "ItemCode": "",
 "SubDept": "Games",
 "ClassID": "6718",
 "ImageURL": "https://twg.azure-api.net/twlProductImage/productImage/887961963618/format/png/size/small",
 "Dept": "Toys",
 "SubClassID": "2095",
 "Class": "Branded Games",
 "ProductKey": "2749306"
 }]
 }, {
 "Description": "A Stick and a Stone by Sarina Dickson",
 "Products": [{
 "Class0": "Stationery",
 "Barcode": "9781869714697",
 "ItemDescription": "",
 "DeptID": "06035",
 "SubClass": "Story Time General",
 "Class0ID": "09929",
 "SubDeptID": "7097",
 "Description": "A Stick and a Stone by Sarina Dickson",
 "ItemCode": "",
 "SubDept": "Childrens Books",
 "ClassID": "6664",
 "ImageURL": "https://twg.azure-api.net/twlProductImage/productImage/9781869714697/format/png/size/small",
 "Dept": "Books",
 "SubClassID": "1346",
 "Class": "Story Time",
 "ProductKey": "2780135"
 }]
 }, {
 "Description": "Zing Catch A Bubble",
 "Products": [{
 "Barcode": "00008983106085"
 }]
 }, {
 "Description": "In a Minute Mum",
 "Products": [{
 "Barcode": "09781781711354"
 }]
 }
 */

extension SearchResultModel{
    static let mockData: SearchResultModel = {
        SearchResultModel(hitCount: "100", results: [ProductResultsModel(description: "A Stick and a Stone by Sarina Dickson", products: [Product(barcode: "9781869714697", description: "A Stick and a Stone by Sarina Dickson", imageUrl: "https://twg.azure-api.net/twlProductImage/productImage/9781869714697/format/png/size/small", productKey: "2780135", price: Price(price: "12", type: "NAT"))]),
                                                     ProductResultsModel(description: "Escape Room in a Box Game A", products: [Product(barcode: "887961963618", description: "Escape Room in a Box Game A", imageUrl: "https://twg.azure-api.net/twlProductImage/productImage/887961963618/format/png/size/small", productKey: "2749306", price: Price(price: "15", type: "NAT"))])])
    }()
    static let emptyData: SearchResultModel = {
        SearchResultModel(hitCount: "100", results: [ProductResultsModel(description: "A Stick and a Stone by Sarina Dickson", products: [])])
    }()
}
