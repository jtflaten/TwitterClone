//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Jake Flaten on 7/18/17.
//  Copyright © 2017 Break List. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let users: [User] = {
        let riryUser = User(name: "Chef", username: "@chefriry", bioText: "I was a cook on the ship, we were attacked. I thought i died. yabaDaba daboatoeofsj asdfij fjdsjb fdjk fdsajkkjhdf  saa", profileImage: #imageLiteral(resourceName: "profile_image"))
        let vindaUser = User(name: "Vinda", username: "@avindaknight", bioText: "I am a very strong knight. be careful trying to fight mea asdfgjhagf asdhgfweg dsfhgjad hsadfikjh weiuh sdfb sad fgiucu asdfjhue jdshafkjh dakld  dsad  sda hsdad hdsasd kjsad sad sasd sad saad sad kad", profileImage: #imageLiteral(resourceName: "vinda_profile"))
        return [riryUser, vindaUser]
    }()
    
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
