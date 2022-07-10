//
//  ProductView.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 9/07/22.
//

import SwiftUI
import Kingfisher

struct ProductView: View {
    var selectedProductBarcode : String
    @StateObject var priceViewModel = PriceViewModelImplementation(
        fetchPriceService: FetchPriceServiceImplementation())
    var body: some View {
        VStack{
           
            if  priceViewModel.price == nil && priceViewModel.error == nil {
                LoadingView(text: NSLocalizedString("loading", comment: "loading data from api"))
                }
                else if (priceViewModel.error != nil) {
                    ErrorView()
                }
                else{
                    VStack{
                            if let image = priceViewModel.price?.product.imageUrl {
                                
                                KFImage.url(URL(string: image))
                                         .loadDiskFileSynchronously()
                                         .cacheMemoryOnly()
                                         .fade(duration: 0.25)
                                        
                                         .onProgress { receivedSize, totalSize in  }
                                         .onSuccess { result in  }
                                         .onFailure { error in }
                                         .resizable()
                                         .frame(width:  UIScreen.main.bounds.size.width, height:  UIScreen.main.bounds.size.width).cornerRadius(10)
                        }
                        
                        if let description = priceViewModel.price?.product.description{
                            Text(description).font(.title2) .frame(maxWidth: .infinity, alignment: .leading).padding(.vertical)
                        }
                        if let price = priceViewModel.price?.product.price?.price{
                            Text(createAttributedString(title: NSLocalizedString("price", comment: "product price"), label: price)).frame(maxWidth: .infinity, alignment: .leading).padding(.vertical)
                        }
                        
                    }.padding()
                   Spacer()
                }
                
            
            }.task {
                await priceViewModel.fetchPrice(barcode: selectedProductBarcode)
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(selectedProductBarcode: "")
    }
}
