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
     
        if let data = getClosedFiguresData() {
            
            for i in data {
                print(i)
            }
        }
    }
}


extension GameController: DrawFiguresProtocol {
   
    
    func getFieldFrame() -> (w: Double, h: Double) {
        
        let width = Double(self.view.frame.width)
        let height = Double(self.view.frame.height)
        
        return (width, height)
    }
    
    func getClosedFiguresData() -> [FigureData]? {
        
        let placements = level.getPlacementInfo()
        
        let logic = self.logic.placements
     
        let fieldFrame = getFieldFrame()
        
        return logic.getClosedFiguresData(placements: placements, field: fieldFrame)
    }
    
    
}






