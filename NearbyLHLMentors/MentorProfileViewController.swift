//
//  MentorProfileViewController.swift
//  NearbyLHLMentors
//
//  Created by Renato Camilio on 2016-04-13.
//  Copyright © 2016 Renato Camilio. All rights reserved.
//

import UIKit

class MentorProfileViewController: UIViewController {

    var mentor: Mentor! {
        if let mentor.ava
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var githubBadgeView: SocialBadgeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(animated: Bool) {
        APIManager.fetchMentor(withId: mentor.id) { [weak self] (response) in
            if let detailedMentor = response.result.value {
                self?.mentor = detailedMentor
            }
        }
    }
    
}
