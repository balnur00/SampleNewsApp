//
//  Source.swift
//  TestNewsApp
//
//  Created by Balnur Sakhybekova on 1/26/21.
//  Copyright © 2021 Balnur Sakhybekova. All rights reserved.
//

import Foundation
import ObjectMapper

struct Source: Mappable {
    
    var name: String!
    
    init?(map: Map) {}
    
    init() {}
    
    mutating func mapping(map: Map) {
        name <- map["name"]
    }
    
    
}
