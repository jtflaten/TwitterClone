//
//  HomeDatasource.swift
//  TwitterClone
//
//  Created by Jake Flaten on 7/18/17.
//  Copyright © 2017 Break List. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let words = ["user1", "user2", "user3"]
    
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
        return words.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return words[indexPath.item]
    }
}
