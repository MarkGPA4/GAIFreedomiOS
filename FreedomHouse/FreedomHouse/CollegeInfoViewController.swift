//
//  CollegeInfoViewController.swift
//  FreedomHouse
//
//  Created by Eric Park on 2/4/16.
//  Copyright © 2016 Mark Li . All rights reserved.
//

import UIKit

<<<<<<< Updated upstream
class CollegeInfoViewController: UIViewController {
=======
<<<<<<< HEAD
class CollegeInfoViewController: UITableViewController {
>>>>>>> Stashed changes

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
<<<<<<< Updated upstream

=======
    
=======
class CollegeInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

>>>>>>> c35ed305074043c2fc77f1a39703987e97d79f80
>>>>>>> Stashed changes
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
<<<<<<< Updated upstream

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

=======
<<<<<<< HEAD
    
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
    
=======

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

>>>>>>> c35ed305074043c2fc77f1a39703987e97d79f80
>>>>>>> Stashed changes
}
