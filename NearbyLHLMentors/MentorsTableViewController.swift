//
//  MentorsTableViewController.swift
//  NearbyLHLMentors
//
//  Created by Renato Camilio on 2016-04-13.
//  Copyright © 2016 Renato Camilio. All rights reserved.
//

import UIKit

class MentorsTableViewController: UITableViewController {

    var mentors = [Mentor]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        
        APIManager.fetchMentors { [weak self] response in
            if let people = response.result.value {
                self!.mentors = people.filter { (mentor) -> Bool in
                    return mentor.specialties.count > 0
                }
                
                self?.tableView.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mentors.count
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MentorTableViewCell", forIndexPath: indexPath) as! MentorTableViewCell
        
        cell.mentor = mentors[indexPath.row]
        
        return cell
    }
    
}
