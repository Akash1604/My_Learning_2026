//
//  EndPoint.swift
//  LearnSwiftUI
//
//  Created by Akash Revanna on 02/08/26.
//
import Foundation

enum HttpMethods:String {
    case get = "GET"
}
protocol EndPointType {
    var baseURL:String { get }
    var path:String { get }
    var url:URL? { get }
    var httpMethod: HttpMethods { get }
    var httpBody:[String:String]? { get }
    var header:[String:String]? { get }
    var mockFileName:String { get }
}
