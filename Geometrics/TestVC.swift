//
//  TestVC.swift
//  Geometrics
//
//  Created by Alexey A on 08.02.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

import Foundation
import UIKit

class TestVC: UIViewController {
    
    var lvl = Level()
    
    @IBAction func showField(_ sender: UIButton) {
        
        msg(obj: sender)
    }
 
    
    @IBAction func lvlEasy(_ sender: UIButton) {
        
        lvl.setDifficulty(difficulty: .easy)
        msg(obj: sender)
    }
    
    
    @IBAction func lvlNorm(_ sender: UIButton) {
        lvl.setDifficulty(difficulty: .normal)
        msg(obj: sender)
    }
    
    
    @IBAction func lvlHard(_ sender: UIButton) {
       // lvl.setCurrentLevel(levelType: .hard)
        msg(obj: sender)
    }
 
    func msg(obj: UIButton) {
        print("This is \(obj.titleLabel?.text! ?? "NONE") ")
        print(lvl.getCurrentLevel())
    }
}
