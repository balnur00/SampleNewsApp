//
//  ArticleList.swift
//  TestNewsApp
//
//  Created by Balnur Sakhybekova on 1/26/21.
//  Copyright © 2021 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire

struct ArticleList {
    typealias responseList = (Result<Response>) -> Void
    
    public static func getArticles(_ completion: @escaping responseList){
    AF.request("http://newsapi.org/v2/everything?q=apple&from=2021-01-24&to=2021-01-24&sortBy=popularity&apiKey=306e8cdf70974a1d8ceebb4e789d9714").responseJSON(completionHandler: { (response: AFDataResponse<Any>) in
            
        print("---------------------------------------------------------")
        print(response)
        })
        
        .responseObject(keyPath: "") { (response: AFDataResponse<Response>) in
            if let response = response.value {
                completion(Result.success(response))
            }
           
        }
    }
}
