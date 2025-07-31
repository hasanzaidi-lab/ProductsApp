//
//  Product.swift
//  ProductsApp
//
//  Created by Hasan Zaidi on 7/9/25.
//

struct ProductList: Decodable {
    let products: [Product]
}

struct Product: Decodable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let category: String
    let rating: Double
    let brand: String?
    let thumbnail: String
}
