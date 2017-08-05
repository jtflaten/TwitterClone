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
    
    required init(json: JSON) throws {
        print("now ready to parse json \n", json)
        var users = [User]()
        let array = json["users"].array
        for userJson in array! {
            let name = userJson["name"].stringValue
            let username = userJson["username"].stringValue
            let bio = userJson["bio"].stringValue
            
            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            users.append(user)
        }
        self.users = users
    }

    
    let tweets: [Tweet] = {
        let riryUser = User(name: "Chef", username: "@chefriry", bioText: "I was a cook on the ship, we were attacked. I thought i died.", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        let tweet = Tweet(user: riryUser, message: "i'v decided to focus on using prayers and a large hammer to do my work on the island. the hammer is haevy, but i want to stay quick, i dont like getting hurt")
        
        let tweet2 = Tweet(user: riryUser, message: "I haven't seen a kitchen in a long time. i probably won't be needing my kitchen clothes or my iron pot. I've taken to wearing the apant's of an assassin and the shirt of a queen.")
        return[tweet, tweet2]
    }()
    
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
