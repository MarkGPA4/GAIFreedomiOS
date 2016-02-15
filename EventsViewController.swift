import UIKit
import DatePickerCell

class EventsViewController: UITableViewController {
    
    var cells:NSArray = []
    var events: [String] = ["SAT","College fair","Party"]
    
    override func viewDidLoad() {
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
        
        // The DatePickerCell.
        
        let datePickerCell = DatePickerCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        let datePickerCell2 = DatePickerCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        let datePickerCell3 = DatePickerCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
      //  let datePickerCell4 = DatePickerCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)
        
        
        var datePickerCells: [DatePickerCell] = [datePickerCell,datePickerCell2,datePickerCell3]
        // Cells is a 2D array containing sections and rows.
        
        
        for cell in datePickerCells{
        cell.leftLabel.text=self.events[datePickerCells.indexOf(cell)!]
        }
        
        cells = [datePickerCells]
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        // Get the correct height if the cell is a DatePickerCell.
        var cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)
        if (cell.isKindOfClass(DatePickerCell)) {
            return (cell as! DatePickerCell).datePickerHeight()
        }
        
        return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Deselect automatically if the cell is a DatePickerCell.
        var cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)
        if (cell.isKindOfClass(DatePickerCell)) {
            
            var datePickerTableViewCell = cell as! DatePickerCell
            datePickerTableViewCell.selectedInTableView(tableView)
            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cells.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells[section].count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cells[indexPath.section][indexPath.row] as! UITableViewCell
    }
    

}
