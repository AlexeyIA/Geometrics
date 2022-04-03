//
//  Logic.swift
//  Geometrics
//
//  Created by Alexey A on 25.03.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

class PlacementsLogic {
    
    func getClosedFiguresData(placements: LevelData.PlacementInfo) -> [FigureData] {
        
        let fieldWidth = FieldData.share.getWidth()
        
        let fieldHeight = FieldData.share.getHeight()
      
        let border = getBorder(viewLength: fieldWidth)
        
        let spacesLength = border * (Double(placements.onX) + 1)
        
        let figureWidth = ( fieldWidth - spacesLength ) / Double(placements.onX)
            
        var figureDatas = [FigureData]()
        
        var currentY = fieldHeight - border
        
        for _ in 1...placements.onY {
            
            var currentX = border
            
            currentY = currentY - border - figureWidth
            
            for _ in 1...placements.onX {
                
                let figureData = FigureData(xPosition: currentX, yPosition: currentY, width: figureWidth)
                
                figureDatas.append(figureData)
                
                currentX = currentX + border + figureWidth
            }
        }
        return figureDatas
    }
    
    
    private func getBorder(viewLength l: Double) -> Double {
        return FieldData.share.borderPercent * l
    }

}


