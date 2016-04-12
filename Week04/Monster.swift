//
//  Monster.swift
//  Week04
//
//  Created by Alex Bornos on 28/03/2016.
//  Copyright © 2016 mecar6. All rights reserved.
//

import UIKit

class Monster: NSObject {
    
    var name:String?
    var type: String?
    var attackPower:Int?
    
    init(newName: String, newAttackPower: Int, newType: String){
        
        name = newName
        type = newType
        attackPower = newAttackPower
    }
    
    

}
