//
//  ProductEndPoint.swift
//  LearnSwiftUI
//
//  Created by Akash Revanna on 02/08/26.
//
import Foundation

enum ProductEndPoint {
    case fetchProducts
}
extension ProductEndPoint:EndPointType {
    var baseURL: String {
        "https://api.restful-api.dev/"
    }
    
    var path: String {
        "objects"
    }
    
    var url: URL? {
        URL(string: baseURL + path)
    }
    
    var httpMethod: HttpMethods {
        .get
    }
    
    var httpBody: [String : String]? {
        nil
    }
    
    var header: [String : String]? {
        nil
    }

    var mockFileName: String {
        "Products"
    }
    
    
}
