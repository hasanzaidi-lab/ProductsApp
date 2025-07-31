//
//  ContentView.swift
//  ProductsApp
//
//  Created by Hasan Zaidi on 7/9/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.products) { product in
                
                HStack {
                    AsyncImage(url: URL(string: product.thumbnail)) { imag in
                        imag
                            .resizable()
                             .clipped()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100.0, height: 100.0)
                    .clipped()

                    VStack(alignment: .leading) {
                                       Text(product.title)
                                           .font(.headline)
                                       Text(product.description)
                                           .font(.caption)
                                   }
                }
                
            }
        }
        .task {
            await viewModel.getProducts()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
