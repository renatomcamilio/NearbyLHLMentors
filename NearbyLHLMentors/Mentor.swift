//
//  Mentor.swift
//  NearbyLHLMentors
//
//  Created by Renato Camilio on 2016-04-13.
//  Copyright © 2016 Renato Camilio. All rights reserved.
//

import ObjectMapper
import CoreLocation

//MARK: - Comparable
func ==(lhs: Mentor, rhs: Mentor) -> Bool {
    return lhs.id == rhs.id
}

func <(lhs: Mentor, rhs: Mentor) -> Bool {
    return lhs.fullName.compare(rhs.fullName) == .OrderedAscending
}


class Mentor: Mappable, Comparable, Hashable {
    
    var id = ""
    var firstName = ""
    var lastName = ""
    var email = ""
    var phoneNumber = ""
    var twitter: String? = nil
    var github = ""
    var avatarURL: String? = nil
    var companyName: String? = nil
    var companyURL: String? = nil
    var quirkyFact = ""
    var specialties = [String]()
    var location: CLLocationCoordinate2D? = nil
    var onDuty = false
    
    var fullName: String {
        return "\(self.firstName) \(self.lastName)"
    }
    
    
    //MARK: - Object Mapper
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["_id"]
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        email <- map["email"]
        phoneNumber <- map["phone_number"]
        twitter <- map["twitter"]
        github <- map["github_username"]
        avatar <- map["avatar_url"]
        companyName <- map["company_name"]
        companyURL <- map["company_url"]
        quirkyFact <- map["quirky_fact"]
        specialties <- map["specialties"]
        location <- map["location"]
        onDuty <- map["on_duty"]
    }
    
    var hashValue: Int { return id.hashValue }
    
}
