//
//  Article.swift
//  TestNewsApp
//
//  Created by Balnur Sakhybekova on 1/26/21.
//  Copyright © 2021 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import ObjectMapper

struct Article: Mappable{
    
    var source: Source!
    var author: String!
    var title: String!
    var description: String!
    var urlToImage: String!
    var publishedAt: String!
    var content: String!
    
    init?(map: Map) {}
    
    init() {}
    
    mutating func mapping(map: Map) {
        source <- map["source"]
        author <- map["author"]
        title <- map["title"]
        description <- map["description"]
        urlToImage <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
        content <- map["content"]
    }
    
    
}
