//
//  Logic.swift
//  Geometrics
//
//  Created by Alexey A on 25.03.2022.
//  Copyright © 2022 Alexey A. All rights reserved.
//

class PlacementsLogic {
        
    func getClosedFiguresData(placements: LevelData.PlacementInfo, field: (w: Double, h: Double)) -> [FigureData] {
        
        let fieldWidth = field.w
        let fieldHeight = field.h
       
        let border = getBorder(viewLength: fieldWidth)
        
        let spacesLength = border * (Double(placements.onX) + 1)
        
        let figureWidth = ( fieldWidth - spacesLength ) / Double(placements.onX)
            
        var currentX = border
        var currentY = fieldHeight - border
        
        var figureDatas = [FigureData]()
        
        for _ in 1...placements.onY {
            currentY = currentY - border - figureWidth
            for _ in 1...placements.onX {
                currentX = currentX + border + figureWidth
                
                let figureData = FigureData(xPosition: currentX, yPosition: currentY, width: figureWidth)
                
                figureDatas.append(figureData)
            }
        }
        return figureDatas
    }
    
    
    private func getBorder(viewLength l: Double) -> Double {
        return FieldData.share.borderPercent * l
    }

}


