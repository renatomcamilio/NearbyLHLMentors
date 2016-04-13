//
//  TechnologyPickerTableViewController.swift
//  NearbyLHLMentors
//
//  Created by Renato Camilio on 2016-04-13.
//  Copyright © 2016 Renato Camilio. All rights reserved.
//

import UIKit

protocol TechnologyPickerDelegate {
    func technologyPickerDidPickTechnology(technology: String)
    func technologyPickerShouldCheckmark(technology: String) -> Bool
}

class TechnologyPickerTableViewController: UITableViewController {

    var specialties: [String]! {
        didSet {
            tableView.reloadData()
        }
    }
    var delegate: TechnologyPickerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return specialties.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SpecialtyTableViewCell", forIndexPath: indexPath) as! SpecialtyTableViewCell
        
        let specialty = specialties[indexPath.row]
        cell.textLabel?.text = specialty
        cell.accessoryType = delegate!.technologyPickerShouldCheckmark(specialty) ? .Checkmark : .None
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! SpecialtyTableViewCell
        
        let specialty = specialties[indexPath.row]
        toggleSpecialty(specialty)
        
        cell.accessoryType = delegate!.technologyPickerShouldCheckmark(specialty) ? .Checkmark : .None
    }
    
    //MARK: - User Interaction
    
    private func toggleSpecialty(specialty: String) {
        delegate?.technologyPickerDidPickTechnology(specialty)
    }
    
}
