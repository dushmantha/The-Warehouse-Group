//
//  Utils.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 9/07/22.
//

import Foundation
// this method can be used for styling and combine the string
/*
 Mathod : create a attribute string
 Params : title - value of the string , label - description of the value
 return : attribute string
 */
func createAttributedString(title : String, label : String)-> AttributedString{
    var string = AttributedString("\(title): \(label)")
    string.foregroundColor = .gray
    string.font = .system(size: 16, weight: .bold)
    
    if let range = string.range(of: label) {
        string[range].foregroundColor = .gray.opacity(0.8)
        string[range].font = .system(size: 16, weight: .regular)
    }
    return string
}
