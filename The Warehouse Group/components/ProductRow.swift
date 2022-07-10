//
//  ProductRow.swift
//  The Warehouse Group
//
//  Created by Tharaka Dushmantha on 9/07/22.
//

import SwiftUI
import Kingfisher

struct ProductRow: View {
    let title : String
    let imageUrl : String
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            HStack{
                KFImage.url(URL(string: imageUrl))
                         .loadDiskFileSynchronously()
                         .cacheMemoryOnly()
                         .fade(duration: 0.25)
                        
                         .onProgress { receivedSize, totalSize in  }
                         .onSuccess { result in  }
                         .onFailure { error in }
                         .resizable()
                             .frame(width: 60.0, height: 60.0)
                Text(title).font(.title3) .frame(maxWidth: .infinity, alignment: .leading)
            }
        }.padding()
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(title: "", imageUrl: "")
    }
}
