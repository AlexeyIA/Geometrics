//
//  GameController.swift
//  Geometrics
//
//  Created by Alexey A on 25.03.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//
import UIKit

class GameController: UIViewController {
    
    private var level = Level(difficulty: .easy)
    
    private var logic = Logic()
    
    @IBAction func startButton(_ sender: Any) {
     
    }
}


extension GameController: DrawFiguresProtocol {
    
    func drawClosedFigures(inWidth: Double) -> [FigureData]? {
        
        let placements = level.getPlacementInfo()
        
        return logic.drawingLogic.calcFigureSize(placements: placements, width: inWidth)
        
    }
    

    
}






