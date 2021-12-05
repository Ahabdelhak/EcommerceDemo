//
//  ProductModel.swift
//  EcommerceDemo
//
//  Created by Ahmed Amer on 25/11/2021.
//

import Foundation

struct ProductModel: Codable {
     var response: [Product]?
 }
 
struct Product: Codable {
     var categoryName: String?
     var products: [ProductDetails]?
 }

struct ProductDetails: Codable {
     var name: String?
     var imageName: String?
     var price: String?
     var description: String?
 }
