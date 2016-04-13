//
//  MyStackViewController.swift
//  NearbyLHLMentors
//
//  Created by Renato Camilio on 2016-04-13.
//  Copyright © 2016 Renato Camilio. All rights reserved.
//

import UIKit
import INTULocationManager


class MyStackViewController: UIViewController, TechnologyPickerDelegate {

    @IBOutlet weak var technologiesDescriptionLabel: UILabel!
    
    var pickedTechnologies = [String]()
    var specialties = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.fetchMentors { (response) in
            if response.result.isFailure { print("Failed fetching Mentors: \(response.result.error)") }
            
            let mentors = response.result.value
            let specialties = mentors?.reduce(Set<String>(), combine: { (specialties, mentor) -> Set<String> in
                return specialties.union(mentor.specialties)
            })
            
            self.specialties = Array(specialties ?? []).sort()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        getUserLocation()
        updateUI()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "showTechnologyPickerTableViewController":
                let destinationVC = segue.destinationViewController as! TechnologyPickerTableViewController
                destinationVC.specialties = Array(specialties)
                destinationVC.delegate = self
            default: break
            }
        }
    }
    
    private func getUserLocation() {
        INTULocationManager.sharedInstance().requestLocationWithDesiredAccuracy(.Block, timeout: 15, delayUntilAuthorized: true) {
            (location, accuracy, status) in
            if status == .Success || status == .TimedOut {
                if status == .TimedOut {
                    print("Request timed-out: \(location)")
                }
            } else {
                print("Failed getting user location: \(status)")
            }
        }
    }
    
    private func updateUI() {
        technologiesDescriptionLabel.text = "You've picked \(pickedTechnologies.count) technologies"
    }
    
    //MARK: Technology Picker
    
    func technologyPickerDidPickTechnology(technology: String) {
        if pickedTechnologies.contains(technology) {
            pickedTechnologies.removeAtIndex(pickedTechnologies.indexOf(technology)!)
        } else {
            pickedTechnologies.append(technology)
        }
    }
    
    func technologyPickerShouldCheckmark(technology: String) -> Bool {
        return pickedTechnologies.contains(technology)
    }

}
