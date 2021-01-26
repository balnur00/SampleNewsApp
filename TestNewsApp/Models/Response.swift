//
//  Response.swift
//  TestNewsApp
//
//  Created by Balnur Sakhybekova on 1/26/21.
//  Copyright © 2021 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import ObjectMapper

struct Response: Mappable {
    
    var status: String!
    var totalResults: Int!
    var articles: [Article]!
    
    init?(map: Map) {}
    
    init() {}
    
    mutating func mapping(map: Map) {
        status <- map["status"]
        totalResults <- map["totalResults"]
        articles <- map["articles"]
    }
    
}
