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
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 72.0
    }
    
 /*   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let reuseIdentifier = "programmaticCell"
        var cell = self.table.dequeueReusableCellWithIdentifier(reuseIdentifier) as! MGSwipeTableCell!
        if cell == nil
        {
            cell = MGSwipeTableCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: reuseIdentifier)
        }
        
        cell.textLabel!.text = "Title"
        cell.detailTextLabel!.text = "Detail text"
        cell.delegate = self //optional
        
        //configure left buttons
        cell.leftButtons = [MGSwipeButton(title: "", icon: UIImage(named:"check.png"), backgroundColor: UIColor.greenColor())
            ,MGSwipeButton(title: "", icon: UIImage(named:"fav.png"), backgroundColor: UIColor.blueColor())]
        cell.leftSwipeSettings.transition = MGSwipeTransition.Rotate3D
        
        //configure right buttons
        cell.rightButtons = [MGSwipeButton(title: "Delete", backgroundColor: UIColor.redColor())
            ,MGSwipeButton(title: "More",backgroundColor: UIColor.lightGrayColor())]
        cell.rightSwipeSettings.transition = MGSwipeTransition.Rotate3D
        
        return cell
    } */
    
}
