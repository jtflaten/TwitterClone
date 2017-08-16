//
//  Service.swift
//  TwitterClone
//
//  Created by Jake Flaten on 8/15/17.
//  Copyright © 2017 Break List. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    static let sharedInstance = Service()
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    
    
  
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource) -> ()) {
        let request: APIRequest<HomeDatasource,JSONError> = tron.request("/twitter/home")
        
        request.perform(withSuccess:  { (homeDataSource) in
            
           
            completion(homeDataSource)
            
        }) { (err) in
            print("failed json fetch", err)
        
            
        }
        
        
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON Erron")
        }
    }
    
}
