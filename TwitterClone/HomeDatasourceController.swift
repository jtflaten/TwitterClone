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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setupNavigationBar()
        
        fetchHomeFeed()
       
//        let homeDatasource = HomeDatasource()
//        self.datasource = homeDatasource
        
    }
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
  
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON Erron")
        }
    }
    
    fileprivate func fetchHomeFeed() {
        let request: APIRequest<HomeDatasource,JSONError> = tron.request("/twitter/home")
    
        request.perform(withSuccess:  { (homeDataSource) in
            print("Succesfully fetched JSON object")
            
            self.datasource = homeDataSource
        }) { (err) in
            print("failed json fetch", err)
        }
    
    }
    
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        if let user = self.datasource?.item(indexPath) as? User{
            let approximatedWidthOfTextView = view.frame.width - 12 - 50 - 12 - 2
            let size = CGSize(width: approximatedWidthOfTextView, height: 1000)
            let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
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
