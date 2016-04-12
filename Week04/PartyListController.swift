//
//  PartyListController.swift
//  Week04
//
//  Created by Alex Bornos on 28/03/2016.
//  Copyright © 2016 mecar6. All rights reserved.
//

import UIKit

class PartyListController: UITableViewController, addMonsterDelegate{
    
    
    var currentParty: NSMutableArray
    
    required init?(coder aDecoder: NSCoder){
        self.currentParty = NSMutableArray()
        super.init(coder: aDecoder)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch(section){
        case 0: return self.currentParty.count
        case 1: return 1
        default: return 0
        }
    }
    
        
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            if indexPath.section == 0
                
            {
                
                let cellIdentifier = "MonsterCell"
                
                let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MonsterCell
                
                // Configure the cell...
                
                let m: Monster = self.currentParty[indexPath.row] as! Monster
                
                cell.nameLabel.text = m.name
                
                cell.attackLabel.text = "AttackPower: \(m.attackPower!)"
                
                if m.type == "Grass"
                    
                {
                    
                    cell.attackLabel.textColor = UIColor.greenColor()
                    
                }
                
                if m.type == "Fire"
                    
                {
                    
                    cell.attackLabel.textColor = UIColor.redColor()
                    
                }
                
                if m.type == "Water"
                    
                {
                    
                    cell.attackLabel.textColor = UIColor.blueColor()
                    
                }
                
                if m.type == "Electric"
                    
                {
                    
                    cell.attackLabel.textColor = UIColor.yellowColor()
                    
                }
                
                return cell
                
            }
                
            else{
                
                let cell = tableView.dequeueReusableCellWithIdentifier("TotalCell", forIndexPath: indexPath)
                
                cell.textLabel!.text = "Total Monsters: \(currentParty.count)"
                
                return cell
                
            }
            
        }
    
    override func tableView(tableView:UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool{
        if indexPath.section == 0{
            return true
        }
        else
        {
            return false
        }
        
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath
        
        indexPath: NSIndexPath) {
            
            if editingStyle == .Delete {
                
                // Delete the row from the data source
                
                self.currentParty.removeObjectAtIndex(indexPath.row)
                
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                
                let totalPath = NSIndexPath(forRow: 0, inSection: 1)
                
                tableView.reloadRowsAtIndexPaths([totalPath], withRowAnimation: .None)
                
            }
            
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "AddMonsterSegue"
            
        {
            
            let controller: AddMonsterController = segue.destinationViewController as! AddMonsterController
            
            controller.delegate = self
            
        }
        
    }
    
    func addMonster(monster: Monster) {
        
        self.currentParty.addObject(monster)
        
        self.tableView.reloadData()
        
    }
        
}
