//
//  Tweet.swift
//  TwitterClone
//
//  Created by Jake Flaten on 7/31/17.
//  Copyright © 2017 Break List. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init (json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        
        self.message = json["message"].stringValue
    }
}
