//
//  CollegeInfoViewController.swift
//  FreedomHouse
//
//  Created by Eric Park on 2/4/16.
//  Copyright © 2016 Mark Li . All rights reserved.
//

import UIKit

class CollegeInfoViewController: UITableViewController {

    let EventsList : [String] = ["Harvard","Yale","Princeton","Brown","Cornell","Columbia","MIT","Dartmouth","Boston University","UCLA","Stanford","CIT"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerNib(UINib(nibName: "CollegesTableViewCell", bundle: nil), forCellReuseIdentifier: "CollegesTableViewCell")
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.EventsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : CollegesTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("CollegesTableViewCell") as! CollegesTableViewCell
        
        cell.College?.text = self.EventsList[indexPath.row]
        
        
        /*let cellIdentifier = "EventsTableViewCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell!
        if cell == nil {
        cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: cellIdentifier)
        }*/
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 72.0
    }
    
}
