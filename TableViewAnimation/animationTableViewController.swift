//
//  animationTableViewController.swift
//  TableViewAnimation
//
//  Created by Liu Jingkai on 15/9/6.
//  Copyright (c) 2015年 Liu Jingkai. All rights reserved.
//

import UIKit

class animationTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
        
        let diff = 0.1
        
        let tableHeight = self.tableView.bounds.size.height
        
        let cells:[UITableViewCell] = self.tableView.visibleCells() as! [UITableViewCell]
        
        for cell in cells {
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        for i in 0..<cells.count {
            let cell:UITableViewCell = cells[i] as UITableViewCell
            
            var delay = diff * Double(i)
            
            UIView.animateWithDuration(1, delay: delay, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                cell.transform = CGAffineTransformMakeTranslation(0, 0)
            }, completion: nil)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 20
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = "Id: \(indexPath.row)"
        cell.detailTextLabel?.text = "Check Id : \(indexPath.row)"
        return cell
    }
}