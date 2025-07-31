//
//  ViewModel.swift
//  ProductsApp
//
//  Created by Hasan Zaidi on 7/9/25.
//
import Foundation

class ViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    
    @MainActor
    func getProducts() async  {
            do {
                try await fetchProducts()
            } catch {
                print("Error fetching products: \(error)")
            }
    }
    
    func fetchProducts() async throws {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            return
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        let productList = try JSONDecoder().decode(ProductList.self, from: data)
        
        self.products = productList.products
    }
}
