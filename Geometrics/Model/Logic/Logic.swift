//
//  Logic.swift
//  Geometrics
//
//  Created by Alexey A on 25.03.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

class Logic {
    
    weak var controller: GameController?
    
    let placements = PlacementsLogic()
    
    let gameplay = GameplayLogic()
    
    func play(inLevel lvl: Level) {
        
        switch gameplay.getState() {
        
        case .setFigureData:
            
            SetFigureDataLogic.share.setSelectedFigure(level: lvl)
            
            let d = SetFigureDataLogic.share.setFigureData(inLevel: lvl)
            
            controller!.setFigureData(data: d)
            
        case .setFigureViews:
            
            controller!.setFigureViews()
            
            
        case .closeFigures:
            print("Play for state closeFigures")
            
        default:
            break
        }
    }
    
    
    
    
}

