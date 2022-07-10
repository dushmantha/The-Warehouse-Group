//
//  UserDefultHelper.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 9/07/22.
//

import Foundation


enum UserDefaultsKeys : String {
    case userID
}

extension UserDefaults{

    //MARK: Save User ID
    func setUserID(value: String){
        set(value, forKey: UserDefaultsKeys.userID.rawValue)
    }

    //MARK: Retrieve User ID
    func getUserID() -> String?{
        return string(forKey: UserDefaultsKeys.userID.rawValue)
    }
}
