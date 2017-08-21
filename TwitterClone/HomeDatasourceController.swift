//
//  HomeDatasourceController.swift
//  TwitterClone
//
//  Created by Jake Flaten on 7/18/17.
//  Copyright © 2017 Break List. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasourceController: DatasourceController {
   
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Our Apologies, something's gone wrong. Please try again later."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true

        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview()   
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setupNavigationBar()
        
        Service.sharedInstance.fetchHomeFeed{ (homeDataSource, err) in
            if let err = err {
                self.errorMessageLabel.isHidden = false
                print("HomeDataSourceController error fetching json: ", err)
                return
            }
            self.datasource = homeDataSource
           
            
        }
       

        
    }

    
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            if let user = self.datasource?.item(indexPath) as? User{
                let approximatedWidthOfTextView = view.frame.width - 12 - 50 - 12 - 2
                let size = CGSize(width: approximatedWidthOfTextView, height: 1000)
                let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
                let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
                return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
            }
        } else if indexPath.section == 1 {
            guard let tweet = self.datasource?.item(indexPath) as? Tweet else
            { return .zero }
                let approximatedWidthOfTextView = view.frame.width - 12 - 50 - 12 - 2
                let size = CGSize(width: approximatedWidthOfTextView, height: 1000)
                let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
                let estimatedFrame = NSString(string: tweet.message).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
                return CGSize(width: view.frame.width, height: estimatedFrame.height + 74)
            
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 69)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 83)
    }
    
}
