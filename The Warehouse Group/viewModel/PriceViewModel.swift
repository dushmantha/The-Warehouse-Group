//
//  PriceViewModel.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 7/07/22.
//

import Foundation


protocol PriceViewModel : ObservableObject {
    func fetchPrice(barcode : String) async
}
extension ProductView{
    @MainActor
    final class PriceViewModelImplementation : PriceViewModel {
        @Published private(set) var price: PriceModel?
        @Published private(set) var error: Error?
        private let fetchPriceService : FetchPriceService
        
        // dependency injection
        init(fetchPriceService : FetchPriceService){
            self.fetchPriceService = fetchPriceService
        }
        
        /*
         Mathod : Fetching price - protocol
         Params : nil
         return : nil
         */
        
        func fetchPrice(barcode : String) async  {
            let params = "Barcode=\(barcode)&MachineID=\(APIConstants.machineID)&UserID=\(UserDefaults.standard.getUserID() ?? "")"
            do{
                let price = try await fetchPriceService.fetchPrice(queryParam: params)
                self.price = price
            } catch{
                debugPrint("Error loading : \(String(describing: error))")
                self.error = error
            }
        }
    }
}
