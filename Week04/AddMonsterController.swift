//
//  AddMonsterController.swift
//  Week04
//
//  Created by Alex Bornos on 28/03/2016.
//  Copyright © 2016 mecar6. All rights reserved.
//

import UIKit

protocol addMonsterDelegate{
    
    func addMonster(monster: Monster)
    
}

class AddMonsterController: UITableViewController {
    var allMonsters = [Monster]()
    var delegate: addMonsterDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        let m1 = Monster(newName: "Bulbasaur", newAttackPower: 100, newType: "Grass")
        
        let m2 = Monster(newName: "Charmander", newAttackPower: 150, newType: "Fire")
        
        let m3 = Monster(newName: "Squirtle", newAttackPower: 130, newType: "Water")
        
        let m4 = Monster(newName: "Pikachu", newAttackPower: 110, newType: "Electric")
        
        allMonsters.append(m1)
        
        allMonsters.append(m2)
        
        allMonsters.append(m3)
        
        allMonsters.append(m4)
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) ->Int {
        return 1
    }
    
    override func tableView(tableview: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allMonsters.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "MonsterCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MonsterCell
        
        //configuring cell
        
        let m:Monster = self.allMonsters[indexPath.row]
        cell.nameLabel.text = m.name
        cell.attackLabel.text = "AttackPower: \(m.attackPower)"
        
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
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedMonster: Monster = self.allMonsters[indexPath.row]
        self.delegate!.addMonster(selectedMonster)
        self.navigationController!.popViewControllerAnimated(true)
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

   


}
