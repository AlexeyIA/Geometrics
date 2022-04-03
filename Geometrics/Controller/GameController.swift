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
    
    private var figureViews = FigureViews()

    @IBAction func startButton(_ sender: Any) {
        
        setFieldFrame()
        
        drawClosedFigures()
    }
}


extension GameController: DrawFiguresProtocol {
    
    func setFieldFrame() {
        
        let width = Double(self.view.frame.width)
        let height = Double(self.view.frame.height)
        
        FieldData.share.setFieldFrame(w: width, h: height)
    }
    
    func getClosedFiguresData() -> [FigureData] {
        
        let placements = level.getPlacementInfo()
        
        let logic = self.logic.placements
     
        return logic.getClosedFiguresData(placements: placements)
    }
}

extension GameController {
    
    func drawClosedFigures() {
        
        let data = getClosedFiguresData()
        
        let cFigures = figureViews.getClosedFigureViews(data: data)

        for closedFigure in cFigures {
            
            view.addSubview(closedFigure)
        }
       
    }
}






