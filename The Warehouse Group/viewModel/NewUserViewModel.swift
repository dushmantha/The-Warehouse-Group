//
//  NewUserViewModel.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 7/07/22.
//

import Foundation

protocol NewUserViewModel : ObservableObject {
    func fetchNewUser() async
}
extension ContentView{
    @MainActor
    final class NewUserViewModelImplementation : NewUserViewModel {
        @Published private(set) var userID: String?
        @Published private(set) var error: Error?
        private let fetchNewUserService : FetchNewUserService
        
        // dependency injection
        init(fetchNewUserService : FetchNewUserService){
            self.fetchNewUserService = fetchNewUserService
        }
        
        /*
         Mathod : Fetching new user - protocol
         Params : nil
         return : nil
         */
        
        func fetchNewUser() async  {
            do{
                let newUser = try await fetchNewUserService.fetchNewUser()
                if newUser.userID != nil {
                    UserDefaults.standard.setUserID(value: newUser.userID!)
                    userID = newUser.userID
                }
            } catch{
                debugPrint("Error loading : \(String(describing: error))")
                self.error = error
            }
        }
    }
}
