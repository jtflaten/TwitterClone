//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Jake Flaten on 7/18/17.
//  Copyright © 2017 Break List. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
 
    let users: [User]
    let tweets: [Tweet]
    
    required init(json: JSON) throws {
        

        guard let userJsonArray = json["users"].array, let tweetsJsonArray = json["tweets"].array else {
            throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey: "one of the json dictionarys does not parse to a valid object"])
        }
       
        
        self.users = userJsonArray.map({return User(json: $0)})
        self.tweets = tweetsJsonArray.map({return Tweet(json: $0)})

      
    }

    
 
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return[UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return[UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
    
}
