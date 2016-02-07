//
//  GradesViewController.swift
//  FreedomHouse
//
//  Created by Mark Li  on 2/6/16.
//  Copyright © 2016 Mark Li . All rights reserved.
//

import UIKit

class GradesViewController: UITableViewController {
        
    let Grade : [String] = ["SAT","SAT2","AP","GPA"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerNib(UINib(nibName: "GradesTableViewCell", bundle: nil), forCellReuseIdentifier: "GradesTableViewCell")
        
        
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
        return self.Grade.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : GradesTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("GradesTableViewCell") as! GradesTableViewCell
        
        cell.Grade?.text = self.Grade[indexPath.row]
        
        
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
