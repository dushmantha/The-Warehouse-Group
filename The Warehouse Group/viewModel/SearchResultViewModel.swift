//
//  SearchResultViewModel.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 7/07/22.
//

import Foundation

protocol SearchResultViewModel : ObservableObject {
    func fetchSearchResult(search: String, isLoadMore : Bool) async
}
extension ProductListView{
    @MainActor
    final class SearchResultViewModelImplementation : SearchResultViewModel {
        @Published private(set) var products: [Product] = []
        @Published private(set) var error: Error?
        private let fetchSearchResultService : FetchSearchResultService
        
          // Limit of records per page. (Only if backend supports, it usually does)
       
        var startIndex = 0
        let perPage = 20
        // dependency injection
        init(fetchSearchResultService : FetchSearchResultService){
            self.fetchSearchResultService = fetchSearchResultService
        }
        
        /*
         Mathod : Fetching search result - protocol
         Params : nil
         return : nil
         */
        
        func fetchSearchResult(search: String, isLoadMore : Bool) async  {
            if(search.isEmpty){
                return
            }
            if(!isLoadMore){
                startIndex = 0
                self.products = []
            }
            let params = "Start=\(String(startIndex))&Limit=\(String(perPage))&Search=\(search)&UserID=\(UserDefaults.standard.getUserID() ?? "")"
            do{
                let searchResult = try await fetchSearchResultService.fetchSearchResult(queryParam: params)
                let value  = searchResult.results.map {$0.products!}.reduce([], +).filter{$0.description != nil}
                self.products.append(contentsOf: value)
                startIndex += perPage + 1
            } catch{
                debugPrint("Error loading : \(String(describing: error))")
                self.error = error
            }
        }
    }
}
