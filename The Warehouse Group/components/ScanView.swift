//
//  ScanView.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 7/07/22.
//

import SwiftUI
import CodeScanner

struct ScanView: View {
    @State private var isShowingScanner = false
    @State private var actionState: Int? = 0
    @State  private var  value: String = ""
    var body: some View {
       
                        VStack {
                            NavigationLink(destination: ProductView(selectedProductBarcode: value), tag: 1, selection: $actionState) {
                               
                            }
                            VStack{
                                Button{
                                    isShowingScanner = true
                                } label: {
                                    Label("Scan", systemImage: "qrcode.viewfinder")
                                }
                            }.sheet(isPresented: $isShowingScanner) {
                                CodeScannerView(codeTypes: [.ean13], completion:handleScan)
                            }
                        }
                    }
     
        
    
    
     func handleScan(result: Result<ScanResult, ScanError>) {
       isShowingScanner = false
        switch result {
        case .success(let result):
            value = result.string
            self.actionState = 1
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
}


