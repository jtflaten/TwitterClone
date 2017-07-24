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
    
    // let words = ["user1", "user2", "user3"]
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return[UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return[UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
}
