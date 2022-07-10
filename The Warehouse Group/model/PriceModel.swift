//
//  PriceModel.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 6/07/22.
//

import Foundation

struct Price :  Decodable {
    let price: String
    let type : String
    
    enum CodingKeys: String, CodingKey {
        case price = "Price"
        case type = "Type"
    }
}

struct PriceModel: Decodable {
    let action: String
    let scanBarcode : String
    let found  : String
    let product : Product
    
    enum CodingKeys: String, CodingKey {
        case action = "Action"
        case scanBarcode = "ScanBarcode"
        case found  = "Found"
        case product = "Product"
    }
}

/*
 {
   "MachineID": "208 ",
   "Action": "S",
   "ScanBarcode": "9400032284477",
   "ScanID": "1868252",
   "UserDescription": "",
   "Product": {
     "Class0": "Services",
     "Price": {
       "Price": "1",
       "Type": "NAT"
     },
     "Barcode": "9400032284477",
     "ItemDescription": "",
     "DeptID": "06018",
     "SubClass": "Fundraising Product",
     "Class0ID": "09934",
     "SubDeptID": "6256",
     "Description": "Add a Dollar Campaign for Hospice",
     "BranchPrice": "1",
     "ItemCode": "",
     "SubDept": "B2C Services",
     "ClassID": "6386",
     "ImageURL": "https://twg.azure-api.net/twlProductImage/productImage/9400032284477/format/png/size/small",
     "Dept": "Services",
     "SubClassID": "4627",
     "Class": "Fundraising",
     "ProductKey": "1649641"
   },
   "ProdQAT": "Prod",
   "ScanDateTime": "2022-07-07T16:04:48",
   "Found": "Y",
   "UserID": "FC8BFB51-F5E5-4E57-ADC6-48CB0CF38906"
 }
 */
extension PriceModel{
    static let mockData: PriceModel = {
        PriceModel(action: "S", scanBarcode: "9400032284477", found: "Y", product: Product(barcode: "9400032284477", description: "Add a Dollar Campaign for Hospice", imageUrl: "https://twg.azure-api.net/twlProductImage/productImage/9400032284477/format/png/size/small", productKey: "1649641", price: Price(price: "16", type: "NAT")))
    }()
}
