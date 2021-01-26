//
//  Route.swift
//  TestNewsApp
//
//  Created by Balnur Sakhybekova on 1/26/21.
//  Copyright © 2021 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import Alamofire

public enum APIRouter: URLRequestConvertible {
    
    case articleList
    
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .articleList:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .
        
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .employeeList(let page):
            if let page = page {
                return ["page" : page]
            }
            return nil
        case .employeeDetail:
            return nil
        case .login(let username, let password):
            return ["username" : username,
                    "password" : password]
        case .employeeListPage:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    public func asURLRequest() throws -> URLRequest {
        var baseURL: String {
            switch App.mode {
            case .test:
                return App.testURL
            case .prod:
                return App.baseURL
            }
        }
        let url = try URL(string: baseURL)!
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        addAuthHeader(&urlRequest)
    
        print(urlRequest.url?.absoluteURL ?? "")
        print(urlRequest.httpMethod ?? "--")
        print(urlRequest.urlRequest?.allHTTPHeaderFields ?? "-")
        
        // Parameters
        switch self.method {
        case .post, .put:
            if let parameters = parameters {
                do {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                    return try URLEncoding.default.encode(urlRequest, with: nil)
                } catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
            }
        default:
            return try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        return urlRequest
    }
    
    public func addAuthHeader(_ request: inout URLRequest) {
        switch self {
        case .login:
            break
        default:
            if let token = UserModel.currentUser.token {
                request.setValue("JWT \(token)", forHTTPHeaderField: "Authorization")
            }
        }
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
}
