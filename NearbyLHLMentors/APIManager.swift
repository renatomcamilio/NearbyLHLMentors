//
//  APIManager.swift
//  NearbyLHLMentors
//
//  Created by Renato Camilio on 2016-04-13.
//  Copyright © 2016 Renato Camilio. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper


class APIManager {
    
    private static let url = "http://skillsbc.vansortium.com"

    
    static func mentors(completionHandler: Response<[Mentor], NSError> -> Void) {
        Alamofire.request(.GET, "\(APIManager.url)/mentors")
            .responseArray { (response: Response<[Mentor], NSError>) in completionHandler(response) }
    }
    
}
