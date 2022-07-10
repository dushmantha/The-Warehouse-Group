//
//  LoadingView.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 9/07/22.
//

import SwiftUI

struct LoadingView: View {
    let text: String
    var body: some View {
        VStack( spacing: 8){
            ProgressView()
            Text(text)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(text: "Fetching Data")
    }
}
