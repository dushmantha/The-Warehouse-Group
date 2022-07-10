//
//  ContentView.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 6/07/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userViewModel = NewUserViewModelImplementation(
        fetchNewUserService: FetchNewUserServiceImplementation())
        
    var body: some View {
        if UserDefaults.standard.getUserID() != nil {
            ProductListView()
        } else {
            ZStack{
                if userViewModel.userID == nil && userViewModel.error == nil {
                    LoadingView(text: NSLocalizedString("loading", comment: "loading data from api"))
                }
                
                else if userViewModel.error != nil {
                    ErrorView()
                }
                else {
                    ProductListView()
                }
            }.task {
                await userViewModel.fetchNewUser()
            }
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
