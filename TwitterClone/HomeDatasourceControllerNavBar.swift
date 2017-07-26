//
//  HomeDatasourceControllerNavBar.swift
//  TwitterClone
//
//  Created by Jake Flaten on 7/26/17.
//  Copyright © 2017 Break List. All rights reserved.
//

import UIKit

extension HomeDatasourceController {
    func setupNavigationBar() {
        configureNavBarGeneral()
        setRightNavBarItems()
        setLeftNavBarItem()
    }
    
    private func setLeftNavBarItem() {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "GitHub-Mark-32px").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    private func configureNavBarGeneral() {
        let titleImage = UIImageView(image: #imageLiteral(resourceName: "icons8-Twitter-50"))
        titleImage.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImage.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleImage
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }
    
    private func setRightNavBarItems() {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "icons8-Search-64").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "icons8-Edit-26").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: searchButton), UIBarButtonItem(customView: composeButton)]
    }
}
