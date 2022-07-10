//
//  ProductListView.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 7/07/22.
//

import SwiftUI



struct ProductListView: View {
    @StateObject var productListViewModel = SearchResultViewModelImplementation(
        fetchSearchResultService: FetchSearchResultServiceImplementation()
    )
    
    @State private var searchText: String = ""
    var body: some View {
        NavigationView{
            VStack{
                ZStack(alignment: .top){
                    ScanView()
                }
                
                Spacer()
                Group{
                    if  productListViewModel.products.count == 0{
                        EmptyDataView()
                    }
                    else if (productListViewModel.error != nil) {
                        ErrorView()
                    }
                    else{
                        List(productListViewModel.products, id: \.productKey){ product in
                            ZStack{
                                NavigationLink(destination: ProductView(selectedProductBarcode: product.barcode!)) {
                                }
                                ProductRow(title: product.description ?? "", imageUrl: product.imageUrl ?? "")
                                    .onAppear {
                                        self.getNextPageIfNecessary(barcode: product.barcode!)
                                    }
                            }
                        }
                    }
                }.task {
                    await productListViewModel.fetchSearchResult(search: searchText, isLoadMore: false)
                }.listStyle(.plain)
                    .searchable(text: $searchText)
                    .onChange(of: searchText) { value in
                        Task{
                            await productListViewModel.fetchSearchResult(search: searchText, isLoadMore: false)
                        }
                    }
                    .onSubmit {
                        Task{
                            await productListViewModel.fetchSearchResult(search: searchText, isLoadMore: false)
                        }
                    }
                    .navigationTitle(LocalizedStringKey("product.list"))
                Spacer()
            }
        }
    }
    private func getNextPageIfNecessary(barcode : String) {
        if barcode == productListViewModel.products.last?.barcode {
            Task{
                await productListViewModel.fetchSearchResult(search: searchText, isLoadMore: true)
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
