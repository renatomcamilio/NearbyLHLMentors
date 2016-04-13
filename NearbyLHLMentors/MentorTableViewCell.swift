//
//  MentorTableViewCell.swift
//  NearbyLHLMentors
//
//  Created by Renato Camilio on 2016-04-13.
//  Copyright © 2016 Renato Camilio. All rights reserved.
//

import UIKit

class MentorTableViewCell: UITableViewCell {

    @IBOutlet weak var fullNameLabel: UILabel!
    
    var mentor: Mentor? {
        didSet {
            fullNameLabel.text = mentor?.fullName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        mentor = nil
    }

}
