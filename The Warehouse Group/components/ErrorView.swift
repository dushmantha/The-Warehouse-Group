//
//  ErrorView.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 9/07/22.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
        VStack{
            Text(LocalizedStringKey("network.error.title")).font(.title3)
            VStack{
                Image(systemName: "icloud.slash.fill").font(.system(size: 16, weight: .black))
                Text(LocalizedStringKey("network.error.description")).multilineTextAlignment(.center)
                
            }.padding()
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
